import 'package:munich/data/models/network/movie_details_response/movie_details_response.dart';
import 'package:munich/data/models/network/movies_response/movies_response.dart';
import 'package:munich/data/network/network_client/network_client.dart';
import 'package:munich/domain/models/movie_details.dart';
import 'package:munich/domain/models/movies.dart';
import 'package:munich/domain/models/movies_type.dart';
import 'package:munich/domain/services/movie/movie_service.dart';
import 'package:munich/locator/locator.dart';

class MovieServiceImpl implements MovieService {
  final _networkClient = locator<NetworkClient>();

  @override
  Future<Movies> getMovies({required MoviesType type}) async {
    final response = await _networkClient.getMovies(type.rawValue);
    return response.toMovies();
  }

  @override
  Future<MovieDetails> getMovieDetails({required int id}) async {
    final response = await _networkClient.getMovieDetails(id);
    return response.toMovieDetails();
  }

  @override
  Future<Movies> getSimilarMovies({required int id}) async {
    final response = await _networkClient.getSimilarMovies(id);
    return response.toMovies();
  }
}
