import 'package:flutter/material.dart';

import '../../model/wallpaper.dart';
import '../../view/wallpaper_screen.dart';

Widget showList(List<Wallpaper> right) {
  return GridView.builder(
    itemCount: right.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: (4 / 5)),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WallpaperScreen(
                        imgUrl: right[index].imgSrc,
                      )));
        },
        child: Hero(
          tag: "open",
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    right[index].imgSrc,
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      );
    },
  );
}
