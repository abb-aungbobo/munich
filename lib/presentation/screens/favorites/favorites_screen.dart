import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:munich/app_router/app_router.dart';
import 'package:munich/app_router/route_observer.dart';
import 'package:munich/presentation/screens/favorites/favorites_cubit.dart';
import 'package:munich/presentation/ui_components/error_dialog/error_dialog.dart';
import 'package:munich/presentation/ui_components/movie_card_view/movie_card_view.dart';
import 'package:munich/presentation/ui_components/movie_card_view/movie_card_view_model.dart';

class FavoritesBlocProvider extends StatelessWidget {
  const FavoritesBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit()..getFavorites(),
      child: const FavoritesScreen(),
    );
  }
}

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    context.read<FavoritesCubit>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if (state.error != null) {
          showErrorDialog(context, error: state.error).then((_) {
            if (context.mounted) {
              context.read<FavoritesCubit>().clearError();
            }
          });
        }
      },
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return _buildScaffold(context, state: state);
        },
      ),
    );
  }

  Widget _buildScaffold(
    BuildContext context, {
    required FavoritesState state,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      body: state.movies.isEmpty
          ? _buildEmpty(context)
          : _buildList(context, state: state),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 4),
          const Text("No favorites yet!"),
        ],
      ),
    );
  }

  Widget _buildList(
    BuildContext context, {
    required FavoritesState state,
  }) {
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
