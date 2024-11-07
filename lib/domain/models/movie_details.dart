import 'package:munich/domain/models/genre.dart';

class MovieDetails {
  final List<Genre> genres;
  final int id;
  final String? overview;
  final String? posterPath;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;

  String? get posterUrl {
    if (posterPath == null) {
      return null;
    } else {
      return "https://image.tmdb.org/t/p/w500/$posterPath";
    }
  }

  const MovieDetails({
    required this.genres,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });
}
