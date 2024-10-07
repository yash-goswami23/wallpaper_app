import 'package:flutter/material.dart';

Widget showBottomItem(IconData icon, VoidCallback onPressed) {
  return Expanded(
      child: InkWell(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Icon(
        icon,
        size: 45,
      ),
    ),
  ));
}
