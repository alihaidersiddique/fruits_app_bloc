part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteEvent {}

class FavouriteStartedEvent extends FavouriteEvent {}

class FavouriteAddedEvent extends FavouriteEvent {
  final Fruit fruit;

  FavouriteAddedEvent(this.fruit);
}

class FavouriteRemovedEvent extends FavouriteEvent {
  final Fruit fruit;

  FavouriteRemovedEvent(this.fruit);
}
