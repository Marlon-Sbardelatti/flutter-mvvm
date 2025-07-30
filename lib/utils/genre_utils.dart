import 'package:mvvm/models/movies_genre.dart';
import 'package:mvvm/repository/movies_repo.dart';
import 'package:mvvm/service/init_getit.dart';

class GenreUtils {
  static List<MoviesGenre> moviesGenreNames(List<int> genreIds) {
    final moviesRepository = getIt<MoviesRepository>();
    final cachedGenres = moviesRepository.cachedGenres;
    List<MoviesGenre> moviesGenre = [];

    for (var genreId in genreIds) {
      var genre = cachedGenres.firstWhere((g) => g.id == genreId,
          orElse: () => MoviesGenre(id: 5448484, name: 'Unknown'));
      moviesGenre.add(genre);
    }

    return moviesGenre;
  }
}
