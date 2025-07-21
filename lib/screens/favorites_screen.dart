import 'package:flutter/material.dart';
import 'package:mvvm/constants/my_app_icons.dart';
import 'package:mvvm/widgets/movies/movies_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                MyAppIcons.delete,
                color: Colors.red,
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
