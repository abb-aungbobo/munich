import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munich/domain/models/movie.dart';
import 'package:munich/domain/models/movies_type.dart';
import 'package:munich/domain/services/movie/movie_service.dart';
import 'package:munich/locator/locator.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final _movieService = locator<MovieService>();

  MoviesCubit() : super(MoviesState());

  void clearError() {
    emit(
      state.copyWith(error: null),
    );
  }

  void getMovies({required MoviesType type}) async {
    emit(
      state.copyWith(isLoading: true),
    );
    try {
      final movies = await _movieService.getMovies(type: type);
      emit(
        state.copyWith(isLoading: false, movies: movies.results),
      );
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, error: e),
      );
    }
  }
}

class MoviesState {
  final bool isLoading;
  final Object? error;
  final List<Movie> movies;

  const MoviesState({
    this.isLoading = false,
    this.error,
    this.movies = const [],
  });

  MoviesState copyWith({
    bool? isLoading,
    Object? error,
    List<Movie>? movies,
  }) {
    return MoviesState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      movies: movies ?? this.movies,
    );
  }
}
