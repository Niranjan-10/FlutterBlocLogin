import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/bloc/home/home_bloc.dart';
import 'package:firebase_login/services/firebase_auth_service.dart';
import 'package:firebase_login/services/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  HomeBloc _homeBloc;
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  LoginBloc(this._homeBloc) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is Login){
      yield* _mapEventToLoginToState(event.email, event.password);
    }
  }

  Stream<LoginState> _mapEventToLoginToState(String email, String password) async*{
    yield LoginSubmit();
    try{
     UserCredential result = await _firebaseAuthService.logIn(email, password);
      // await _homeBloc.mapEventToGetData(result.user);

      yield LoginSucess("Success",result.user); 

    }on PlatformException catch(e, s){
      yield LoginFail(message: e.code);
    }catch(e,s){
      yield LoginFail(message: e.toString());
    }
  }
}
