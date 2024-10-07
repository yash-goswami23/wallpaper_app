import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper/utils/utils.dart';
import 'package:wallpaper_manager_plus/wallpaper_manager_plus.dart';

import '../res/components/btn.dart';

class WallpaperScreen extends StatelessWidget {
  final String imgUrl;
  const WallpaperScreen({super.key, required this.imgUrl});

  Future<void> setWallpaper(location) async {
    var file = await DefaultCacheManager().getSingleFile(imgUrl);
    WallpaperManagerPlus().setWallpaper(file, location);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Hero(
          tag: 'open',
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imgUrl), fit: BoxFit.cover)),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          tooltip: "Set Wallpaper",
          onPressed: () async {
            showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text("Whare Set Wallpaper"),
                    content: Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              setWallpaper(WallpaperManagerPlus.homeScreen)
                                  .then(
                                (value) {
                                  showToast("Successful");
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                            child: blackBtn("Home Screen")),
                        GestureDetector(
                            onTap: () {
                              setWallpaper(WallpaperManagerPlus.lockScreen)
                                  .then(
                                (value) {
                                  showToast("Successful");
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                            child: blackBtn("Lock Screen")),
                        GestureDetector(
                            onTap: () {
                              setWallpaper(WallpaperManagerPlus.bothScreens)
                                  .then(
                                (value) {
                                  showToast("Successful");
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                            child: blackBtn("Both Screen")),
                      ],
                    ),
                  );
                });
          },
          child: const Icon(Icons.now_wallpaper),
        ),
      ),
    );
  }
}
