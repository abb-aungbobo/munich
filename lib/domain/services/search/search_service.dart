import 'package:munich/domain/models/movies.dart';

abstract class SearchService {
  Future<Movies> searchMovies({required String query});
}
