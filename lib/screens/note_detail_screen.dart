import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class NoteDetailScreen extends StatefulWidget {
  NoteDetailScreen(this.note, {super.key});
  QueryDocumentSnapshot note;

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  @override
  Widget build(BuildContext context) {
    int colorIndex = widget.note['color'];
    return Scaffold(
      backgroundColor: Style.cardsColor[colorIndex],
      appBar: AppBar(
        backgroundColor: Style.cardsColor[colorIndex],
        elevation: Style.elevation,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Style.spacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.note['title'], style: Style.mainTitle),
              const SizedBox(height: Style.spacing),
              Text(widget.note['created'], style: Style.dateTitle),
              const SizedBox(height: Style.spacing),
              Text(widget.note['content'], style: Style.mainContent),
            ],
          ),
        ),
      ),
    );
  }
}
