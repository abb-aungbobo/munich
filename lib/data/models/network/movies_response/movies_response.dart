import 'package:json_annotation/json_annotation.dart';
import 'package:munich/data/models/network/movie_response/movie_response.dart';
import 'package:munich/domain/models/movies.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  final List<MovieResponse> results;

  const MoviesResponse({
    required this.results,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

extension MoviesResponseToMovies on MoviesResponse {
  Movies toMovies() {
    return Movies(results: results.toMovies());
  }
}
