import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.overview,
    super.posterPath,
    super.backdropPath,
    super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      releaseDate: json['release_date'] as String? ?? '',

      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteCount: json['vote_count'] as int?,
    );
  }
}

class MovieResponseModel {
  const MovieResponseModel({required this.results});

  final List<MovieModel> results;

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      MovieResponseModel(results: (json['results'] as List? ?? []).map((e) => MovieModel.fromJson(e as Map<String, dynamic>)).toList());
}
