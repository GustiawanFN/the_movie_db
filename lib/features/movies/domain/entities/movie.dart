import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  const Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    this.voteCount,
  });

  final int id;
  final String title;
  final String releaseDate;
  final double voteAverage;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final int? voteCount;

  @override
  List<Object?> get props => [id, title, releaseDate, voteAverage, overview, posterPath, backdropPath, voteCount];
}
