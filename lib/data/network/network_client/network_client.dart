import 'package:dio/dio.dart';
import 'package:munich/data/configuration/environment.dart';
import 'package:munich/data/models/network/movie_details_response/movie_details_response.dart';
import 'package:munich/data/models/network/movies_response/movies_response.dart';
import 'package:munich/data/network/endpoint/movie_endpoint.dart';
import 'package:munich/data/network/endpoint/search_endpoint.dart';
import 'package:retrofit/retrofit.dart';

part 'network_client.g.dart';

@RestApi(baseUrl: "${Environment.apiBaseUrl}${Environment.version}")
abstract class NetworkClient {
  factory NetworkClient(Dio dio) = _NetworkClient;

  @GET(MovieEndpoint.movies)
  Future<MoviesResponse> getMovies(@Path() String type);

  @GET(MovieEndpoint.movieDetails)
  Future<MovieDetailsResponse> getMovieDetails(@Path() int id);

  @GET(MovieEndpoint.similarMovies)
  Future<MoviesResponse> getSimilarMovies(@Path() int id);

  @GET(SearchEndpoint.searchMovies)
  Future<MoviesResponse> searchMovies(@Query("query") String query);
}
