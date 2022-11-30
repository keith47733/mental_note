import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/style.dart';
import '../widgets/note_card.dart';
import 'note_editor_screen.dart';
import 'note_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _gotoNoteDetailScreen(BuildContext context, QueryDocumentSnapshot note) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NoteDetailScreen(note)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      appBar: AppBar(
        elevation: Style.elevation,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Image.asset('assets/images/brain.png'),
        ),
        title: const Text('MENTAL NOTE'),
        titleTextStyle: Style.mainTitle,
        backgroundColor: Style.bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Style.spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('notes').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: Style.spacing,
                        crossAxisSpacing: Style.spacing,
                      ),
                      children: snapshot.data!.docs
                          .map((note) => noteCard(
                                () => _gotoNoteDetailScreen(context, note),
                                note,
                              ))
                          .toList(),
                    );
                  }
                  return Text(
                    'There are no notes',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
            Text(
                'Illustration by Ouch! [https://icons8.com/illustrations/author/zD2oqC8lLBBA]',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NoteEditorScreen(),
            ),
          );
        },
        label: const Text('Add note'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
