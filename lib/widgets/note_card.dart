import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../style/style.dart';

Widget noteCard(
    BuildContext context, Function()? onTap, QueryDocumentSnapshot note) {
  final DateTime date = DateTime.fromMillisecondsSinceEpoch(note['date']);

  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(Style.spacing),
      decoration: BoxDecoration(
        color: Style.cardsColor[note['color']],
        borderRadius: BorderRadius.circular(Style.radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note['title'],
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: Style.spacing / 2),
          Text(
            DateFormat('MMM d, yyyy\nhh:mm a').format(date),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: Style.spacing / 2),
          Text(
            note['content'],
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    ),
  );
}
