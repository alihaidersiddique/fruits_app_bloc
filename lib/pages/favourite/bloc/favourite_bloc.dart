import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruits_app_bloc/app_repository.dart';
import 'package:fruits_app_bloc/models/fruit.dart';
import 'package:fruits_app_bloc/pages/favourite/models/favourite.dart';
import 'package:meta/meta.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final AppRepository appRepository;

  FavouriteBloc({required this.appRepository})
      : super(FavouriteLoadingState()) {
    on<FavouriteStartedEvent>(_onFavouriteStartedEvent);
    on<FavouriteAddedEvent>(_onFavouriteAddedEvent);
    on<FavouriteRemovedEvent>(_onFavouriteRemovedEvent);
  }

  Future<FutureOr<void>> _onFavouriteStartedEvent(
    FavouriteStartedEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    emit(FavouriteLoadingState());
    try {
      final favourites = await appRepository.loadFavourites();
      emit(FavouriteLoadedState(
        favourite: FavouriteModel(items: [...favourites]),
      ));
    } catch (e) {
      emit(FavouriteErrorState(e.toString()));
    }
  }

  FutureOr<void> _onFavouriteAddedEvent(
    FavouriteAddedEvent event,
    Emitter<FavouriteState> emit,
  ) {
    final state = this.state;
    if (state is FavouriteLoadedState) {
      try {
        appRepository.addToFavourite(event.fruit);
        emit(
          FavouriteLoadedState(
            favourite: FavouriteModel(
              items: [...state.favourite.items, event.fruit],
            ),
          ),
        );
      } catch (e) {
        FavouriteErrorState(e.toString());
      }
    }
  }

  FutureOr<void> _onFavouriteRemovedEvent(
    FavouriteRemovedEvent event,
    Emitter<FavouriteState> emit,
  ) {
    final state = this.state;
    if (state is FavouriteLoadedState) {
      try {
        appRepository.removeFromFavourite(event.fruit);
        emit(
          FavouriteLoadedState(
            favourite: FavouriteModel(
              items: [...state.favourite.items]..remove(event.fruit),
            ),
          ),
        );
      } catch (e) {
        FavouriteErrorState(e.toString());
      }
    }
  }
}
