import 'package:munich/domain/models/movie.dart';

abstract class FavoriteService {
  List<Movie> getFavorites();
  Future<Movie> favorite({required Movie movie});
  Future<void> unfavorite({required Movie movie});
  bool isFavorite({required Movie movie});
}
