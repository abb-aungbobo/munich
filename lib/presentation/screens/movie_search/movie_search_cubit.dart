import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munich/domain/models/movie.dart';
import 'package:munich/domain/services/search/search_service.dart';
import 'package:munich/locator/locator.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  final _searchService = locator<SearchService>();

  MovieSearchCubit() : super(MovieSearchState());

  void clearError() {
    emit(
      state.copyWith(error: null),
    );
  }

  void searchMovies({required String query}) async {
    if (query.isEmpty) {
      emit(
        state.copyWith(movies: []),
      );
      return;
    }
    emit(
      state.copyWith(isLoading: true),
    );
    try {
      final movies = await _searchService.searchMovies(query: query);
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

class MovieSearchState {
  final bool isLoading;
  final Object? error;
  final List<Movie> movies;

  const MovieSearchState({
    this.isLoading = false,
    this.error,
    this.movies = const [],
  });

  MovieSearchState copyWith({
    bool? isLoading,
    Object? error,
    List<Movie>? movies,
  }) {
    return MovieSearchState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      movies: movies ?? this.movies,
    );
  }
}
