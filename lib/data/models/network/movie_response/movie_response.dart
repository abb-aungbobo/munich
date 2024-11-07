import 'package:json_annotation/json_annotation.dart';
import 'package:munich/domain/models/movie.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  final int id;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  final String title;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  final String? overview;

  const MovieResponse({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.overview,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

extension MovieResponseToMovie on MovieResponse {
  Movie toMovie() {
    return Movie(
      id: id,
      posterPath: posterPath,
      title: title,
      voteAverage: voteAverage,
      overview: overview,
    );
  }
}

extension MovieResponseListToMovieList on List<MovieResponse> {
  List<Movie> toMovies() {
    return map((response) => response.toMovie()).toList();
  }
}
