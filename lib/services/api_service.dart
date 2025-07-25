import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm/constants/my_app_api_constants.dart';
import 'package:mvvm/models/movies_genre.dart';
import 'package:mvvm/models/movies_model.dart';

class ApiService {
  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    final url = Uri.parse(
        '${ApiConstants.baseUrl}/movie/popular?language=en-US&page=1');

    final res = await http.get(url, headers: ApiConstants.headers);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return List.from(
          data['results'].map((element) => MovieModel.fromJson(element)));
    } else {
      throw Exception('Failed to load movies: ${res.statusCode}');
    }
  }

  Future<List<MoviesGenre>> fetchGenres() async {
    final url =
        Uri.parse('${ApiConstants.baseUrl}/genre/movie/list?language=en');

    final res = await http.get(url, headers: ApiConstants.headers);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return List.from(
          data['genres'].map((element) => MoviesGenre.fromJson(element)));
    } else {
      throw Exception('Failed to load movies: ${res.statusCode}');
    }
  }
}
