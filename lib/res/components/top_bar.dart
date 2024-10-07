import 'package:flutter/material.dart';
import 'package:wallpaper/res/app_url.dart';

Widget topBar(provider) {
  TextEditingController searchController = TextEditingController();
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                if (searchController.text.isNotEmpty) {
                  provider.fatchData(AppUrl.searchUrl + searchController.text);
                }
              },
              icon: const Icon(Icons.search),
            ),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Search",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topTap(provider.isSelected, "Trending", () {
              //trending
              provider.changeSelectedBtn();
              provider.fatchData(AppUrl.baseUrl);
            }),
            const SizedBox(width: 50),
            topTap(
              !provider.isSelected,
              "New",
              () {
                //new
                provider.changeSelectedBtn();
                provider.fatchData("${AppUrl.searchUrl}New");
              },
            ),
          ],
        ),
      ),
    ],
  );
}

Widget topTap(bool isSelected, String title, VoidCallback onPressed) {
  return Expanded(
    flex: 1,
    child: InkWell(
      onTap: onPressed,
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    ),
  );
}
