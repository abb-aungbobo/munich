import 'package:go_router/go_router.dart';
import 'package:munich/app_router/route_observer.dart';
import 'package:munich/domain/models/movie.dart';
import 'package:munich/presentation/screens/favorites/favorites_screen.dart';
import 'package:munich/presentation/screens/movie_details/movie_details_screen.dart';
import 'package:munich/presentation/screens/movie_search/movie_search_screen.dart';
import 'package:munich/presentation/screens/movies/movies_tab_controller.dart';

class RouteName {
  static const moviesTab = "movies_tab";
  static const movieDetails = "movie_details";
  static const favorites = "favorites";
  static const movieSearch = "movie_search";
}

class RoutePath {
  static const moviesTab = "/movies_tab";
  static const movieDetails = "/movie_details";
  static const favorites = "/favorites";
  static const movieSearch = "/movie_search";
}

final appRouter = GoRouter(
  routes: [
    GoRoute(
      name: RouteName.moviesTab,
      path: RoutePath.moviesTab,
      builder: (context, state) => const MoviesTabController(),
    ),
    GoRoute(
      name: RouteName.movieDetails,
      path: RoutePath.movieDetails,
      builder: (context, state) {
        final movie = state.extra as Movie;
        return MovieDetailsBlocProvider(movie: movie);
      },
    ),
    GoRoute(
      name: RouteName.favorites,
      path: RoutePath.favorites,
      builder: (context, state) => const FavoritesBlocProvider(),
    ),
    GoRoute(
      name: RouteName.movieSearch,
      path: RoutePath.movieSearch,
      builder: (context, state) => const MovieSearchBlocProvider(),
    ),
  ],
  initialLocation: RoutePath.moviesTab,
  observers: [routeObserver],
);
