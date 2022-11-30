import 'package:flutter/material.dart';

import '../style/style.dart';

PreferredSizeWidget appbar(BuildContext context, Color color, String title) {
  return AppBar(
    elevation: Style.elevation,
    backgroundColor: color,
    centerTitle: true,
    title: Text(title),
    titleTextStyle: Theme.of(context).textTheme.titleLarge,
    iconTheme: const IconThemeData(color: Colors.black),
  );
}
