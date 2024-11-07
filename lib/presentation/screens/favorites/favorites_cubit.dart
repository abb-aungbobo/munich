import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munich/domain/models/movie.dart';
import 'package:munich/domain/services/favorite/favorite_service.dart';
import 'package:munich/locator/locator.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final _favoriteService = locator<FavoriteService>();

  FavoritesCubit() : super(FavoritesState());

  void clearError() {
    emit(
      state.copyWith(error: null),
    );
  }

  void getFavorites() {
    try {
      final movies = _favoriteService.getFavorites();
      emit(
        state.copyWith(movies: movies),
      );
    } catch (e) {
      emit(
        state.copyWith(error: e),
      );
    }
  }
}

class FavoritesState {
  final Object? error;
  final List<Movie> movies;

  const FavoritesState({
    this.error,
    this.movies = const [],
  });

  FavoritesState copyWith({
    Object? error,
    List<Movie>? movies,
  }) {
    return FavoritesState(
      error: error,
      movies: movies ?? this.movies,
    );
  }
}
