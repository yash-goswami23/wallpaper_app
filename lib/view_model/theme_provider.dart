import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  void changeTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
