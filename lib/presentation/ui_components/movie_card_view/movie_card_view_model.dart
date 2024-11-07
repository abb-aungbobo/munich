import 'package:munich/domain/models/movie.dart';

class MovieCardViewModel {
  final String? poster;
  final String title;
  final String voteAverage;
  final String? overview;

  const MovieCardViewModel({
    required this.poster,
    required this.title,
    required this.voteAverage,
    required this.overview,
  });
}

extension MovieToMovieCardViewModel on Movie {
  MovieCardViewModel toMovieCardViewModel() {
    final notRated = "Not Rated";
    final userScore =
        "${(this.voteAverage * 10).toStringAsFixed(0)}% User Score";
    final voteAverage = this.voteAverage == 0.0 ? notRated : userScore;
    return MovieCardViewModel(
      poster: posterUrl,
      title: title,
      voteAverage: voteAverage,
      overview: overview,
    );
  }
}
