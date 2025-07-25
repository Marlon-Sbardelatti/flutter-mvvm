import 'package:flutter/material.dart';
import 'package:mvvm/constants/my_app_icons.dart';
import 'package:mvvm/models/movies_genre.dart';
import 'package:mvvm/models/movies_model.dart';
import 'package:mvvm/repository/movies_repository.dart';
import 'package:mvvm/screens/favorites_screen.dart';
import 'package:mvvm/services/api_service.dart';
import 'package:mvvm/services/init_getit.dart';
import 'package:mvvm/services/navigation_service.dart';
import 'package:mvvm/widgets/movies/movies_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<MovieModel> _movies = [];
  int _currentPage = 1;
  bool _isFetching = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isFetching) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    if (_isFetching) {
      return;
    }

    setState(() {
      _isFetching = true;
    });

    try {
      final List<MovieModel> movies =
          await getIt<MoviesRepository>().fetchMovies(page: _currentPage);
      setState(() {
        _movies.addAll(movies);
        _currentPage++;
      });
    } catch (error) {
      getIt<NavigationService>().showSnackbar('An error has ocurred: $error');
    } finally {
      setState(() {
        _isFetching = false;
      });
    }
  }

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
                // List<MovieModel> movies =
                //     await getIt<ApiService>().fetchMovies();
                // print(movies);

                // List<MoviesGenre> genres =
                //     await getIt<ApiService>().fetchGenres();
                // print(genres);

                List<MoviesGenre> genres =
                    await getIt<MoviesRepository>().fetchGenres();
                print(genres);
              },
              icon: Icon(
                MyAppIcons.darkMode,
              ))
        ],
      ),
      body: ListView.builder(
          controller: _scrollController,
          itemCount: _movies.length + (_isFetching ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < _movies.length) {
              return const MoviesWidget();
            } else {
              return const CircularProgressIndicator.adaptive();
            }
          }),
    );
  }
}
