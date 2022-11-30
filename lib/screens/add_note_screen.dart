import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../style/style.dart';
import '../widgets/appbar.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final int colorIndex = Random().nextInt(Style.cardsColor.length);

  final DateTime date = DateTime.now();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }

  void _addNote() async {
    FirebaseFirestore.instance.collection('notes').add({
      'color': colorIndex,
      'title': _titleController.text,
      'date': date.millisecondsSinceEpoch.abs(),
      'content': _contentController.text,
    }).then((_) {
      Navigator.pop(context);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Unable to add note.\nPlease try again later.')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color cardColor = Style.cardsColor[colorIndex];

    return Scaffold(
      backgroundColor: cardColor,
      appBar: appbar(context, cardColor, 'New Note'),
      body: Padding(
          padding: const EdgeInsets.all(Style.spacing),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleTextField(),
                const SizedBox(height: Style.spacing),
                Text(
                  DateFormat('MMM d, yyyy  hh:mm a').format(date),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: Style.spacing),
                _contentTextField(),
              ])),
      floatingActionButton: _renderFAB(),
    );
  }

  Widget _titleTextField() {
    return TextField(
      controller: _titleController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Title',
      ),
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget _contentTextField() {
    return TextField(
      controller: _contentController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Note',
      ),
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }

  Widget _renderFAB() {
    return FloatingActionButton(
      onPressed: () => _addNote(),
      backgroundColor: Colors.black,
      child: const Icon(
        Icons.save,
        color: Colors.white,
      ),
    );
  }
}
