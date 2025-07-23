import 'package:flutter/material.dart';
import 'package:mvvm/constants/my_app_icons.dart';
import 'package:mvvm/models/movies_model.dart';
import 'package:mvvm/screens/favorites_screen.dart';
import 'package:mvvm/services/api_service.dart';
import 'package:mvvm/services/init_getit.dart';
import 'package:mvvm/services/navigation_service.dart';
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
              onPressed: () {
                getIt<NavigationService>().navigate(const FavoritesScreen());
                // getIt<NavigationService>().showSnackbar("Teste teste 123");
              },
              icon: Icon(
                MyAppIcons.favoriteRounded,
                color: Colors.red,
              )),
          IconButton(
              onPressed: () async {
                List<MovieModel> movies =
                    await getIt<ApiService>().fetchMovies();
                print(movies);
              },
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
