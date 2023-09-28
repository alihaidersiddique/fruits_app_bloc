import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app_bloc/models/fruit.dart';
import 'package:fruits_app_bloc/pages/favourite/bloc/favourite_bloc.dart';

Widget buildFruitTile(Fruit fruit) {
  return ListTile(
    title: Text(fruit.name),
    trailing: FavouriteButton(fruit: fruit),
  );
}

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
    required this.fruit,
  });

  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        return switch (state) {
          FavouriteLoadingState() => const Icon(Icons.favorite_border),
          FavouriteErrorState() => Text(state.message),
          FavouriteEmptyState() => const SizedBox.shrink(),
          FavouriteLoadedState() => Builder(
              builder: (context) {
                final isFavourite = state.favourite.items.contains(fruit);

                return IconButton(
                  icon: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: isFavourite
                      ? () {
                          context
                              .read<FavouriteBloc>()
                              .add(FavouriteRemovedEvent(fruit));
                        }
                      : () {
                          context
                              .read<FavouriteBloc>()
                              .add(FavouriteAddedEvent(fruit));
                        },
                );
              },
            ),
        };
      },
    );
  }
}
