part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final List<Fruit> items;

  HomeLoadedState(this.items);
}

final class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);
}
