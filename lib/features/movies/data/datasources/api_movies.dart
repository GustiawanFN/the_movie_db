import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/app_exception.dart';
import '../models/movie_response_model.dart';

class ApiMovies {
  const ApiMovies(this._client);
  final http.Client _client;

  static const _apiKey = String.fromEnvironment('TMDB_API_KEY', defaultValue: 'b031ecd04177e1c9aae4efcb44b3f301');

  Future<List<MovieModel>> fetchMovies() async {
    final uri = Uri.https('api.themoviedb.org', '/3/discover/movie', {
      'api_key': _apiKey,
      'include_adult': 'false',
      'include_video': 'false',
      'language': 'en-US',
      'page': '1',
      'sort_by': 'popularity.desc',
    });

    final res = await _client.get(uri).timeout(const Duration(seconds: 15));
    if (res.statusCode != 200) {
      throw AppException('Server error (${res.statusCode})');
    }
    final json = jsonDecode(res.body) as Map<String, dynamic>;
    return MovieResponseModel.fromJson(json).results;
  }
}
