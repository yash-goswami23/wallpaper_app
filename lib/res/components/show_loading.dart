import 'package:flutter/material.dart';

Widget loadingWidget() {
  return const Center(
    child: SizedBox(
      height: 50,
      width: 50,
      child: CircularProgressIndicator(),
    ),
  );
}
