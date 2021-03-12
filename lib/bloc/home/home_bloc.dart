import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is Home) {
      yield* mapEventToGetData(event.user);
    }
  }

  Stream<HomeState> mapEventToGetData(User user) async* {
    try {
      yield HomeSuccess(user: user);
    } catch (e, s) {
      yield HomeFailed(message: e.toString());
    }
  }
}
