import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munich/domain/models/movie.dart';
import 'package:munich/domain/models/movie_details.dart';
import 'package:munich/domain/services/favorite/favorite_service.dart';
import 'package:munich/domain/services/movie/movie_service.dart';
import 'package:munich/locator/locator.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final _movieService = locator<MovieService>();
  final _favoriteService = locator<FavoriteService>();

  MovieDetailsCubit() : super(MovieDetailsState());

  void clearError() {
    emit(
      state.copyWith(error: null),
    );
  }

  void getMovieDetails({required Movie movie}) async {
    emit(
      state.copyWith(isLoading: true),
    );
    try {
      final movieDetails = await _movieService.getMovieDetails(id: movie.id);
      final similarMovies = await _movieService.getSimilarMovies(id: movie.id);
      final isFavorite = _favoriteService.isFavorite(movie: movie);
      emit(
        state.copyWith(
          isLoading: false,
          movieDetails: movieDetails,
          similarMovies: similarMovies.results,
          isFavorite: isFavorite,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, error: e),
      );
    }
  }

  void favorite({required Movie movie}) async {
    try {
      await _favoriteService.favorite(movie: movie);
      final isFavorite = _favoriteService.isFavorite(movie: movie);
      emit(
        state.copyWith(isFavorite: isFavorite),
      );
    } catch (e) {
      emit(
        state.copyWith(error: e),
      );
    }
  }

  void unfavorite({required Movie movie}) async {
    try {
      await _favoriteService.unfavorite(movie: movie);
      final isFavorite = _favoriteService.isFavorite(movie: movie);
      emit(
        state.copyWith(isFavorite: isFavorite),
      );
    } catch (e) {
      emit(
        state.copyWith(error: e),
      );
    }
  }
}

class MovieDetailsState {
  final bool isLoading;
  final Object? error;
  final MovieDetails? movieDetails;
  final List<Movie> similarMovies;
  final bool isFavorite;

  const MovieDetailsState({
    this.isLoading = false,
    this.error,
    this.movieDetails,
    this.similarMovies = const [],
    this.isFavorite = false,
  });

  MovieDetailsState copyWith({
    bool? isLoading,
    Object? error,
    MovieDetails? movieDetails,
    List<Movie>? similarMovies,
    bool? isFavorite,
  }) {
    return MovieDetailsState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      movieDetails: movieDetails ?? this.movieDetails,
      similarMovies: similarMovies ?? this.similarMovies,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
