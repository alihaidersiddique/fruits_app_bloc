import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app_bloc/pages/favourite/bloc/favourite_bloc.dart';
import 'package:fruits_app_bloc/pages/home/widgets/home_widgets.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          return switch (state) {
            FavouriteLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            FavouriteErrorState() => Center(
                child: Text(state.message),
              ),
            FavouriteEmptyState() => const Center(
                child: Text('No favourite items'),
              ),
            FavouriteLoadedState() => state.favourite.items.isNotEmpty
                ? ListView.builder(
                    itemCount: state.favourite.items.length,
                    itemBuilder: (context, index) {
                      return buildFruitTile(
                        state.favourite.items[index],
                      );
                    },
                  )
                : const Center(
                    child: Text('No favourite items'),
                  )
          };
        },
      ),
    );
  }
}
