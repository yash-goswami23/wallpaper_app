import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/view/spash_screen.dart';
import 'package:wallpaper/view_model/theme_provider.dart';
import 'package:wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WallpaperViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SpashScreen(),
      ),
    );
  }
}
