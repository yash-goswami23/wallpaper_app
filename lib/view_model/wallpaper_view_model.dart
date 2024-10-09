import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/respository/wallpaper_repository.dart';

import '../model/wallpaper.dart';

class WallpaperViewModel with ChangeNotifier {
  final _myRepo = WallpaperRepository();
  final List<Wallpaper> _walpapers = [];
  List<Wallpaper> get wallpapers => _walpapers;
  String errorValue = "";
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isSelected = true;
  bool get isSelected => _isSelected;

  void fatchData(String nextPageUrl) async {
    final value = await _myRepo.getApiData(nextPageUrl);
    value.fold((left) {
      _isLoading = false;
      errorValue = left.message;
    }, (right) {
      _isLoading = false;
      Map<String, dynamic> jsonData = jsonDecode(right.data.body);
      List photos = jsonData['photos'];
      String nextPageUrl = jsonData['next_page'];
      String prevPageUrl = "";
      if (jsonData['page'] > 1) {
        prevPageUrl = jsonData['prev_page'];
      }
      _walpapers.clear();
      for (var element in photos) {
        _walpapers.add(Wallpaper(
            imgSrc: element['src']['portrait'],
            nextPageUrl: nextPageUrl,
            prevPageUrl: prevPageUrl));
      }
    });
    notifyListeners();
  }

  Either<String, List<Wallpaper>> getEV() {
    try {
      if (_walpapers.isNotEmpty) {
        return Right(_walpapers);
      } else {
        throw errorValue;
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  void changeSelectedBtn() {
    _isSelected = !_isSelected;
    notifyListeners();
  }
}
