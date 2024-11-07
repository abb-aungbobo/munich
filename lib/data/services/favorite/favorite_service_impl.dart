import 'package:munich/core/app_error/app_error.dart';
import 'package:munich/data/database/database_client.dart';
import 'package:munich/data/models/database/movie_entity/movie_entity.dart';
import 'package:munich/domain/models/movie.dart';
import 'package:munich/domain/services/favorite/favorite_service.dart';
import 'package:munich/locator/locator.dart';

class FavoriteServiceImpl implements FavoriteService {
  final _databaseClient = locator<DatabaseClient>();

  @override
  List<Movie> getFavorites() {
    final Iterable<MovieEntity> entities = _databaseClient.getAll();
    return entities.toList().toMovies();
  }

  @override
  Future<Movie> favorite({required Movie movie}) async {
    final entity = movie.toMovieEntity();
    await _databaseClient.add(entity);
    return movie;
  }

  @override
  Future<void> unfavorite({required Movie movie}) async {
    try {
      final Iterable<MovieEntity> entities = _databaseClient.getAll();
      final entity =
          entities.toList().firstWhere((entity) => entity.id == movie.id);
      await _databaseClient.delete(entity);
    } catch (e) {
      throw Exception(AppError.generic);
    }
  }

  @override
  bool isFavorite({required Movie movie}) {
    try {
      final Iterable<MovieEntity> entities = _databaseClient.getAll();
      final entity =
          entities.toList().firstWhere((entity) => entity.id == movie.id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
