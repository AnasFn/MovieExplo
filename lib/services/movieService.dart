import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:advance_app/constants/api_key.dart';
import 'package:advance_app/model/movie_model.dart';

class MovieService {
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchTrendingMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/trending/movie/day?language=bn-BD&api_key=$apiKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List;
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  Future<List<Movie>> fetchTopRatedMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List;
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  // Similarly, create fetchTopRatedMovies() method
}