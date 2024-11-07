class Movie {
  final int id;
  final String? posterPath;
  final String title;
  final double voteAverage;
  final String? overview;

  String? get posterUrl {
    if (posterPath == null) {
      return null;
    } else {
      return "https://image.tmdb.org/t/p/w500/$posterPath";
    }
  }

  const Movie({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.overview,
  });
}
