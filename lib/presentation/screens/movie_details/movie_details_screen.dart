import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:munich/app_router/app_router.dart';
import 'package:munich/domain/models/movie.dart';
import 'package:munich/presentation/screens/movie_details/movie_details_cubit.dart';
import 'package:munich/presentation/ui_components/error_dialog/error_dialog.dart';
import 'package:munich/presentation/ui_components/loading_indicator/loading_indicator.dart';
import 'package:munich/presentation/ui_components/movie_card_view/movie_card_view.dart';
import 'package:munich/presentation/ui_components/movie_card_view/movie_card_view_model.dart';
import 'package:munich/presentation/ui_components/movie_details_card_view/movie_details_card_view.dart';
import 'package:munich/presentation/ui_components/movie_details_card_view/movie_details_card_view_model.dart';

class MovieDetailsBlocProvider extends StatelessWidget {
  final Movie movie;

  const MovieDetailsBlocProvider({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit()..getMovieDetails(movie: movie),
      child: MovieDetailsScreen(movie: movie),
    );
  }
}

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieDetailsCubit, MovieDetailsState>(
      listener: (context, state) {
        if (state.error != null) {
          showErrorDialog(context, error: state.error).then((_) {
            if (context.mounted) {
              context.read<MovieDetailsCubit>().clearError();
            }
          });
        }
      },
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          return _buildScaffold(context, state: state);
        },
      ),
    );
  }

  Widget _buildScaffold(
    BuildContext context, {
    required MovieDetailsState state,
  }) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              state.isFavorite ? Icons.favorite : Icons.favorite_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              if (state.isFavorite) {
                context.read<MovieDetailsCubit>().unfavorite(movie: movie);
              } else {
                context.read<MovieDetailsCubit>().favorite(movie: movie);
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          _buildMovieDetails(context, state: state),
          if (state.isLoading) const LoadingIndicator(),
        ],
      ),
    );
  }

  Widget _buildMovieDetails(
    BuildContext context, {
    required MovieDetailsState state,
  }) {
    return ListView(
      children: [
        if (state.movieDetails != null)
          MovieDetailsCardView(
            viewModel: state.movieDetails!.toMovieDetailsCardViewModel(),
          ),
        if (state.similarMovies.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "More Like This",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        for (final movie in state.similarMovies)
          MovieCardView(
            viewModel: movie.toMovieCardViewModel(),
            onTap: () {
              context.pushNamed(RouteName.movieDetails, extra: movie);
            },
          ),
      ],
    );
  }
}
