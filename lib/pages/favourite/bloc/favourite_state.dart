part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteLoadingState extends FavouriteState {}

final class FavouriteErrorState extends FavouriteState {
  final String message;

  FavouriteErrorState(this.message);
}

final class FavouriteEmptyState extends FavouriteState {}

final class FavouriteLoadedState extends FavouriteState {
  final FavouriteModel favourite;

  FavouriteLoadedState({this.favourite = const FavouriteModel()});
}
