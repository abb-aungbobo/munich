import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:munich/app_router/app_router.dart';
import 'package:munich/domain/models/movies_type.dart';
import 'package:munich/presentation/screens/movies/movies_cubit.dart';
import 'package:munich/presentation/ui_components/error_dialog/error_dialog.dart';
import 'package:munich/presentation/ui_components/loading_indicator/loading_indicator.dart';
import 'package:munich/presentation/ui_components/movie_card_view/movie_card_view.dart';
import 'package:munich/presentation/ui_components/movie_card_view/movie_card_view_model.dart';

class MoviesBlocProvider extends StatelessWidget {
  final MoviesType type;

  const MoviesBlocProvider({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit()..getMovies(type: type),
      child: const MoviesScreen(),
    );
  }
}

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MoviesCubit, MoviesState>(
      listener: (context, state) {
        if (state.error != null) {
          showErrorDialog(context, error: state.error).then((_) {
            if (context.mounted) {
              context.read<MoviesCubit>().clearError();
            }
          });
        }
      },
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          return _buildScaffold(state);
        },
      ),
    );
  }

  Widget _buildScaffold(MoviesState state) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMovieList(state),
          if (state.isLoading) const LoadingIndicator(),
        ],
      ),
    );
  }

  Widget _buildMovieList(MoviesState state) {
    return ListView.builder(
      itemCount: state.movies.length,
      itemBuilder: (context, index) {
        final movie = state.movies[index];
        return MovieCardView(
          viewModel: movie.toMovieCardViewModel(),
          onTap: () {
            context.pushNamed(RouteName.movieDetails, extra: movie);
          },
        );
      },
    );
  }
}
