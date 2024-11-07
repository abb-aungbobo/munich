import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:munich/app_router/app_router.dart';
import 'package:munich/domain/models/movies_type.dart';
import 'package:munich/presentation/screens/movies/movies_screen.dart';

class MoviesTabController extends StatelessWidget {
  const MoviesTabController({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: MoviesType.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Munich"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.favorite_outline,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                context.pushNamed(RouteName.favorites);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                context.pushNamed(RouteName.movieSearch);
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              for (final type in MoviesType.values)
                Tab(
                  text: type.title,
                ),
            ],
            isScrollable: true,
            tabAlignment: TabAlignment.center,
          ),
        ),
        body: TabBarView(
          children: [
            for (final type in MoviesType.values)
              MoviesBlocProvider(
                type: type,
              ),
          ],
        ),
      ),
    );
  }
}
