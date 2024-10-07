import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/model/wallpaper.dart';
import 'package:wallpaper/res/components/show_bottom_item.dart';
import 'package:wallpaper/view_model/theme_provider.dart';
import 'package:wallpaper/view_model/wallpaper_view_model.dart';

import '../res/components/app_bar.dart';
import '../res/components/show_list.dart';
import '../res/components/show_loading.dart';
import '../res/components/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Wallpaper> listWal = [];
    WallpaperViewModel provider = Provider.of<WallpaperViewModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Provider.of<ThemeProvider>(context).isDark
              ? Brightness.dark
              : Brightness.light,
          seedColor: Colors.blueAccent,
        ),
      ),
      home: Scaffold(
        appBar: appBar(
            Provider.of<ThemeProvider>(context).isDark
                ? Icons.light_mode
                : Icons.dark_mode,
            "Wallpapers", () {
          Provider.of<ThemeProvider>(context, listen: false).changeTheme();
        }),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: topBar(provider),
            ),
            Expanded(
              child: Consumer<WallpaperViewModel>(
                  builder: (context, value, child) {
                final item = value.getEV();
                if (value.isLoading) {
                  return loadingWidget();
                } else {
                  return item.fold((left) {
                    return Center(
                      child: Text(left),
                    );
                  }, (right) {
                    listWal = right;
                    return showList(right);
                  });
                }
              }),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  showBottomItem(Icons.navigate_before, () {
                    {
                      if (listWal.isNotEmpty) {
                        if (listWal.first.nextPageUrl.isNotEmpty) {
                          provider.fatchData(listWal.first.prevPageUrl);
                        }
                      }
                    }
                  }),
                  showBottomItem(Icons.navigate_next, () {
                    if (listWal.isNotEmpty) {
                      if (listWal.first.nextPageUrl.isNotEmpty) {
                        provider.fatchData(listWal.first.nextPageUrl);
                      }
                    }
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
