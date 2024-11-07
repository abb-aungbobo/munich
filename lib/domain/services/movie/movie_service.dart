import 'package:munich/domain/models/movie_details.dart';
import 'package:munich/domain/models/movies.dart';
import 'package:munich/domain/models/movies_type.dart';

abstract class MovieService {
  Future<Movies> getMovies({required MoviesType type});
  Future<MovieDetails> getMovieDetails({required int id});
  Future<Movies> getSimilarMovies({required int id});
}
