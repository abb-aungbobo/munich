import 'package:munich/domain/models/movie_details.dart';

class MovieDetailsCardViewModel {
  final String genres;
  final int id;
  final String? overview;
  final String? poster;
  final String releaseDate;
  final String runtime;
  final String title;
  final String voteAverage;

  const MovieDetailsCardViewModel({
    required this.genres,
    required this.id,
    required this.overview,
    required this.poster,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });
}

extension MovieDetailsToMovieDetailsCardViewModel on MovieDetails {
  MovieDetailsCardViewModel toMovieDetailsCardViewModel() {
    final genres = this.genres.map((genre) => genre.name).join(" • ");
    final runtime =
        this.runtime > 1 ? "${this.runtime} mins" : "${this.runtime} min";
    final notRated = "Not Rated";
    final userScore =
        "${(this.voteAverage * 10).toStringAsFixed(0)}% User Score";
    final voteAverage = this.voteAverage == 0.0 ? notRated : userScore;
    return MovieDetailsCardViewModel(
      genres: genres,
      id: id,
      overview: overview,
      poster: posterUrl,
      releaseDate: releaseDate,
      runtime: runtime,
      title: title,
      voteAverage: voteAverage,
    );
  }
}
