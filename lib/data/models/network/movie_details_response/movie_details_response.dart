import 'package:json_annotation/json_annotation.dart';
import 'package:munich/data/models/network/genre_response/genre_response.dart';
import 'package:munich/domain/models/movie_details.dart';

part 'movie_details_response.g.dart';

@JsonSerializable()
class MovieDetailsResponse {
  final List<GenreResponse> genres;
  final int id;
  final String? overview;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "release_date")
  final String releaseDate;
  final int runtime;
  final String title;
  @JsonKey(name: "vote_average")
  final double voteAverage;

  const MovieDetailsResponse({
    required this.genres,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}

extension MovieDetailsResponseToMovieDetails on MovieDetailsResponse {
  MovieDetails toMovieDetails() {
    return MovieDetails(
      genres: genres.toGenres(),
      id: id,
      overview: overview,
      posterPath: posterPath,
      releaseDate: releaseDate,
      runtime: runtime,
      title: title,
      voteAverage: voteAverage,
    );
  }
}
