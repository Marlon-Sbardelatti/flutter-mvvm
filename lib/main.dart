import 'package:flutter/material.dart';
import 'package:mvvm/constants/my_app_theme.dart';
import 'package:mvvm/screens/favorites_screen.dart';
import 'package:mvvm/screens/movie_details_screen.dart';
import 'package:mvvm/screens/movies_screen.dart';
import 'package:mvvm/widgets/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      home: const SplashScreen(),
    );
  }
}
