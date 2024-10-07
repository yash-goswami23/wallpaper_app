import 'package:flutter/material.dart';

Widget blackBtn(msg) {
  return Container(
    height: 40,
    width: 100,
    margin: const EdgeInsets.all(5),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(10)),
    child: Text(
      msg,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
