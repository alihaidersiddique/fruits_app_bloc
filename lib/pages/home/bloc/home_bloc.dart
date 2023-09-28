import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app_bloc/app_repository.dart';
import 'package:fruits_app_bloc/models/fruit.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRepository appRepository;

  HomeBloc({required this.appRepository}) : super(HomeLoadingState()) {
    on<HomeStartedEvent>(_onHomeStartedEvent);
  }

  FutureOr<void> _onHomeStartedEvent(
    HomeStartedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    try {
      final fruits = await appRepository.loadFruits();
      emit(HomeLoadedState(fruits));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
