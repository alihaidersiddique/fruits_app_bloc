import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app_bloc/app_repository.dart';
import 'package:fruits_app_bloc/pages/favourite/bloc/favourite_bloc.dart';
import 'package:fruits_app_bloc/pages/favourite/view/favourite.dart';
import 'package:fruits_app_bloc/pages/home/bloc/home_bloc.dart';
import 'package:fruits_app_bloc/pages/home/view/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            appRepository: AppRepository(),
          )..add(HomeStartedEvent()),
        ),
        BlocProvider(
          create: (context) => FavouriteBloc(
            appRepository: AppRepository(),
          )..add(FavouriteStartedEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/favourite': (context) => const Favourite(),
        },
      ),
    );
  }
}
