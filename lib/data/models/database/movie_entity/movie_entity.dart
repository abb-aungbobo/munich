import 'package:munich/domain/models/movie.dart';
import 'package:realm/realm.dart';

part 'movie_entity.realm.dart';

@RealmModel()
class _MovieEntity {
  @PrimaryKey()
  late int id;
  late String? posterPath;
  late String title;
  late double voteAverage;
  late String? overview;
}

extension MovieEntityToMovie on MovieEntity {
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

extension MovieEntityListToMovieList on List<MovieEntity> {
  List<Movie> toMovies() {
    return map((entity) => entity.toMovie()).toList();
  }
}

extension MovieToMovieEntity on Movie {
  MovieEntity toMovieEntity() {
    return MovieEntity(
      id,
      title,
      voteAverage,
      posterPath: posterPath,
      overview: overview,
    );
  }
}
