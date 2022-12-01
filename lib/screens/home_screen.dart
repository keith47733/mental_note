import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';
import '../widgets/appbar.dart';
import '../widgets/note_card.dart';
import 'add_note_screen.dart';
import 'note_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _gotoNoteDetailScreen(BuildContext ctx, QueryDocumentSnapshot note) {
    Navigator.push(
        ctx, MaterialPageRoute(builder: (ctx2) => NoteDetailScreen(note)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      appBar: appbar(context, Colors.black, 'Mental Note'),
      body: Padding(
          padding: const EdgeInsets.all(Style.spacing),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNoteCards(),
              ])),
      floatingActionButton: _renderFAB(),
    );
  }

  Widget _buildNoteCards() {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('notes')
              .orderBy('date', descending: true)
              .snapshots(),
          builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/brain.png'),
                      const SizedBox(height: Style.spacing * 2),
                      Text(
                        'You haven\'t created any notes yet.',
                        style: Theme.of(ctx).textTheme.titleMedium,
                      ),
                    ]),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(
                  // bottom: Style.spacing * 5.75,
                  ),
              child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: Style.spacing,
                    crossAxisSpacing: Style.spacing,
                  ),
                  children: snapshot.data!.docs
                      .map((note) => noteCard(
                            ctx,
                            () => _gotoNoteDetailScreen(ctx, note),
                            note,
                          ))
                      .toList()),
            );
          }),
    );
  }

  Widget _renderFAB() {
    return Padding(
      padding: const EdgeInsets.only(
        right: Style.spacing / 2,
        bottom: Style.spacing / 2,
      ),
      child: FloatingActionButton.extended(
        elevation: Style.elevation,
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNoteScreen(),
              ));
        },
        label: Text(
          'Add Note',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
