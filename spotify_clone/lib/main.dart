import 'package:flutter/material.dart';
import 'package:spotify_clone/core/theme/app_theme.dart';
import 'package:spotify_clone/presentation/splash/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
