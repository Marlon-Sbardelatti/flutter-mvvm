import 'package:flutter/material.dart';
import 'package:mvvm/constants/my_app_theme.dart';
import 'package:mvvm/screens/movies_screen.dart';
import 'package:mvvm/services/init_getit.dart';
import 'package:mvvm/services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      home: const MoviesScreen(),
    );
  }
}
