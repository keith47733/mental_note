import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../style/style.dart';
import '../widgets/appbar.dart';

class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen(this.note, {super.key});
  final QueryDocumentSnapshot note;

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final int colorIndex = widget.note['color'];
    final Color cardColor = Style.cardsColor[colorIndex];

    final DateTime date =
        DateTime.fromMillisecondsSinceEpoch(widget.note['date'], isUtc: true);

    return Scaffold(
        backgroundColor: cardColor,
        appBar: appbar(context, cardColor, 'Mental Note Details'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Style.spacing),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.note['title'],
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: Style.spacing),
              Text(
                DateFormat('MMM d, yyyy  hh:mm a').format(date),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: Style.spacing * 1.5),
              Text(
                widget.note['content'],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ]),
          ),
        ));
  }
}
