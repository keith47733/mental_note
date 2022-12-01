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
          _renderButtons(context, note['color']),
          const SizedBox(height: Style.spacing / 2),
          _renderTitle(context, note['title']),
          const SizedBox(height: Style.spacing / 2),
          Expanded(child: _renderContent(context, note['content'])),
          const SizedBox(height: Style.spacing / 2),
          _renderDate(context, date),
        ],
      ),
    ),
  );
}

Widget _renderButtons(context, index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      InkWell(
          onTap: null,
          child: Icon(
            Icons.favorite_outline,
            color: Style.iconsColor[index],
          )),
      InkWell(
        onTap: null,
        child: Icon(
          Icons.edit,
          color: Style.iconsColor[index],
        ),
      ),
      InkWell(
        onTap: null,
        child: Icon(
          Icons.delete,
          color: Style.iconsColor[index],
        ),
      ),
    ],
  );
}

Widget _renderTitle(context, title) {
  return Text(
    title,
    style: Theme.of(context).textTheme.labelLarge,
    overflow: TextOverflow.ellipsis,
  );
}

Widget _renderContent(context, content) {
  return Text(
    content,
    softWrap: true,
    overflow: TextOverflow.fade,
    style: Theme.of(context).textTheme.bodyMedium,
    textScaleFactor: 0.98,
  );
}

Widget _renderDate(context, date) {
  return FittedBox(
    child: Text(
      DateFormat('MMM d, yyyy  h:mm a').format(date),
      style: Theme.of(context).textTheme.bodySmall,
    ),
  );
}
