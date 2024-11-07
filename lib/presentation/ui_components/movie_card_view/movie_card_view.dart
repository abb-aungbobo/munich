import 'package:flutter/material.dart';
import 'package:munich/presentation/ui_components/movie_card_view/movie_card_view_model.dart';

class MovieCardView extends StatelessWidget {
  final MovieCardViewModel viewModel;
  final Function()? onTap;

  const MovieCardView({
    super.key,
    required this.viewModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewModel.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    viewModel.voteAverage,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  if (viewModel.overview != null)
                    Text(
                      viewModel.overview!,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
