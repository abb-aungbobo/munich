import 'package:flutter/material.dart';
import 'package:munich/presentation/ui_components/movie_details_card_view/movie_details_card_view_model.dart';

class MovieDetailsCardView extends StatelessWidget {
  final MovieDetailsCardViewModel viewModel;

  const MovieDetailsCardView({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  viewModel.poster ?? "",
                  errorBuilder: (context, error, _) => SizedBox(
                    width: 96,
                    height: 144,
                  ),
                  width: 96,
                  height: 144,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.voteAverage,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    viewModel.releaseDate,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    viewModel.runtime,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewModel.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                viewModel.genres,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              if (viewModel.overview != null)
                Text(
                  viewModel.overview!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
            ],
          )
        ],
      ),
    );
  }
}
