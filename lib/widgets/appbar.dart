import 'package:flutter/material.dart';

import '../style/style.dart';

PreferredSizeWidget appbar(BuildContext context, Color color, String title) {
  return AppBar(
    elevation: Style.elevation,
    backgroundColor: color,
    // scrolledUnderElevation: Style.elevation,
    centerTitle: true,
    title: Text(title),
    titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: color == Colors.black ? Colors.white : Colors.black,
        ),
    iconTheme: const IconThemeData(color: Colors.black),
  );
}
