import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int colorIndex = Random().nextInt(Style.cardsColor.length);

  String date = DateTime.now().toString();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.cardsColor[colorIndex],
      appBar: AppBar(
        backgroundColor: Style.cardsColor[colorIndex],
        elevation: Style.elevation,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Add a new note',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Style.spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter title',
              ),
              style: Style.mainTitle,
            ),
            const SizedBox(height: Style.spacing),
            Text(date, style: Style.dateTitle),
            const SizedBox(height: Style.spacing),
            TextField(
              controller: _contentController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter note',
              ),
              style: Style.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseFirestore.instance.collection('notes').add(
            {
              'title': _titleController.text,
              'created': date,
              'content': _contentController.text,
              'color': colorIndex,
            },
          ).then((newNote) {
            print(newNote.id);
            Navigator.pop(context);
          }).catchError((error) {
            print('FAILED TO ADD NOTE: ${error}');
          });
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
