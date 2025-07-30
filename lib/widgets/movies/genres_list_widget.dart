import 'package:flutter/material.dart';
import 'package:mvvm/constants/my_app_constants.dart';
import 'package:mvvm/models/movies_genre.dart';
import 'package:mvvm/models/movies_model.dart';
import 'package:mvvm/utils/genre_utils.dart';

class GenresListWidget extends StatelessWidget {
  const GenresListWidget({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    List<MoviesGenre> moviesGenres =
        GenreUtils.moviesGenreNames(movieModel.genreIds);
    return Wrap(
      children: List.generate(
        moviesGenres.length,
        (index) =>
            chipWidget(genreName: moviesGenres[index].name, context: context),
      ),
    );
  }

  Widget chipWidget(
      {required String genreName, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
          border: Border.all(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            genreName,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
