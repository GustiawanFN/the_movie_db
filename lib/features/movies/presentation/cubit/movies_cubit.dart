import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_exception.dart';
import '../../domain/entities/rating_category.dart';
import '../../domain/usecases/get_movies.dart';
import 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this._getMovies) : super(const MoviesState());

  final GetMovies _getMovies;

  Future<void> load() async {
    emit(state.copyWith(status: MoviesStatus.loading));
    try {
      final movies = await _getMovies();
      emit(state.copyWith(status: MoviesStatus.success, movies: movies));
    } on AppException catch (e) {
      emit(state.copyWith(status: MoviesStatus.failure, error: e.message));
    }
  }

  void search(String query) => emit(state.copyWith(query: query));

  void selectRating(RatingCategory rating) {
    emit(state.copyWith(rating: rating));
  }
}
