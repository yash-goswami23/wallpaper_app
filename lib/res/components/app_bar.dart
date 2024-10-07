import 'package:flutter/material.dart';

//preferredSizedWidget
PreferredSizeWidget appBar(IconData icon, title, VoidCallback onPressed) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      )
    ],
  );
}
