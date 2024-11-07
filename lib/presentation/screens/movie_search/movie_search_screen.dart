import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:munich/app_router/app_router.dart';
import 'package:munich/presentation/screens/movie_search/movie_search_cubit.dart';
import 'package:munich/presentation/ui_components/error_dialog/error_dialog.dart';
import 'package:munich/presentation/ui_components/loading_indicator/loading_indicator.dart';
import 'package:munich/presentation/ui_components/movie_card_view/movie_card_view.dart';
import 'package:munich/presentation/ui_components/movie_card_view/movie_card_view_model.dart';

class MovieSearchBlocProvider extends StatelessWidget {
  const MovieSearchBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieSearchCubit(),
      child: const MovieSearchScreen(),
    );
  }
}

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final _searchController = SearchController();
  final _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieSearchCubit, MovieSearchState>(
      listener: (context, state) {
        if (state.error != null) {
          showErrorDialog(context, error: state.error).then((_) {
            if (context.mounted) {
              context.read<MovieSearchCubit>().clearError();
            }
          });
        }
      },
      child: BlocBuilder<MovieSearchCubit, MovieSearchState>(
        builder: (context, state) {
          return _buildScaffold(context, state: state);
        },
      ),
    );
  }

  Widget _buildScaffold(
    BuildContext context, {
    required MovieSearchState state,
  }) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              _buildSearchBar(context),
              _buildList(context, state: state),
            ],
          ),
          if (state.isLoading) const LoadingIndicator(),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SearchBar(
        controller: _searchController,
        focusNode: _searchFocusNode,
        hintText: "Search",
        trailing: [
          if (_searchController.text.isNotEmpty && _searchFocusNode.hasFocus)
            IconButton(
              icon: Icon(
                Icons.clear,
              ),
              onPressed: () {
                _searchController.clear();
                _searchFocusNode.unfocus();
                context.read<MovieSearchCubit>().searchMovies(query: "");
              },
            ),
        ],
        onChanged: (value) {
          context.read<MovieSearchCubit>().searchMovies(query: value);
        },
        autoFocus: true,
      ),
    );
  }

  Widget _buildList(
    BuildContext context, {
    required MovieSearchState state,
  }) {
    return Expanded(
      child: ListView.builder(
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
      ),
    );
  }
}
