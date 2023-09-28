import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app_bloc/pages/home/bloc/home_bloc.dart';
import 'package:fruits_app_bloc/pages/home/widgets/home_widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fresh Fruits'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.yellow,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/favourite');
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return switch (state) {
            HomeLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            HomeErrorState() => Center(
                child: Text(state.message),
              ),
            HomeLoadedState() => ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return buildFruitTile(
                    state.items[index],
                  );
                },
              ),
          };
        },
      ),
    );
  }
}
