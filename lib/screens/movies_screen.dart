import 'package:flutter/material.dart';
import 'package:mvvm/constants/my_app_icons.dart';
import 'package:mvvm/widgets/movies/movies_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                MyAppIcons.favoriteRounded,
                color: Colors.red,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                MyAppIcons.darkMode,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return MoviesWidget();
          }),
    );
  }
}
