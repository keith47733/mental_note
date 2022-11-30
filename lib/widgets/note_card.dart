import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot note) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(Style.spacing),
      // margin: const EdgeInsets.all(Style.spacing),
      decoration: BoxDecoration(
        color: Style.cardsColor[note['color']],
        borderRadius: BorderRadius.circular(Style.radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note['title'], style: Style.mainTitle),
          const SizedBox(height: Style.spacing / 2),
          Text(note['created'], style: Style.dateTitle),
          const SizedBox(height: Style.spacing / 2),
          Text(
            note['content'],
            overflow: TextOverflow.ellipsis,
            style: Style.mainContent,
          ),
        ],
      ),
    ),
  );
}
