import 'package:equatable/equatable.dart';

import '../../domain/entities/movie.dart';
import '../../domain/entities/rating_category.dart';

enum MoviesStatus { loading, success, failure }

class MoviesState extends Equatable {
  const MoviesState({
    this.status = MoviesStatus.loading,
    this.movies = const [],
    this.rating = const RatingCategory(name: 'All', rateValue: 2),
    this.query = '',
    this.error = '',
  });

  final MoviesStatus status;
  final List<Movie> movies;
  final RatingCategory rating;
  final String query;
  final String error;

  List<Movie> get filtered {
    final q = query.trim().toLowerCase();

    return movies.where((m) {
      final matchesQuery = m.title.toLowerCase().contains(q);
      final matchesRating = rating.isMatch(m.voteAverage);

      return matchesQuery && matchesRating;
    }).toList();
  }

  MoviesState copyWith({MoviesStatus? status, List<Movie>? movies, RatingCategory? rating, String? query, String? error}) => MoviesState(
    status: status ?? this.status,
    movies: movies ?? this.movies,
    rating: rating ?? this.rating,
    query: query ?? this.query,
    error: error ?? this.error,
  );

  @override
  List<Object?> get props => [status, movies, rating.name, query, error];
}
