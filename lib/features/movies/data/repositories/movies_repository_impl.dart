import '../../../../core/app_exception.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movies_repository.dart';
import '../datasources/api_movies.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  const MoviesRepositoryImpl(this._api);
  final ApiMovies _api;

  @override
  Future<List<Movie>> getMovies() async {
    try {
      return await _api.fetchMovies();
    } on AppException {
      rethrow;
    } catch (_) {
      throw const AppException(
        'Gagal memuat data. Periksa koneksi internet lalu coba lagi.',
      );
    }
  }
}
