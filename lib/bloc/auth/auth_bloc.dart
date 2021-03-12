import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/bloc/home/home_bloc.dart';
import 'package:firebase_login/services/firebase_auth_service.dart';
import 'package:firebase_login/services/locator.dart';
import 'package:flutter/services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._homeBloc) : super(AuthInitial());
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();

  HomeBloc _homeBloc;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
      if(event is AuthSignUp){
        print("working here");
       yield* _mapSignUpSubmitToState(event.email,event.password);
      }
  }

  Stream<AuthState> mapForTest(String email,String password)async*{
    print(email);
    print(password);

    yield AuthSubmit();
  }

  Stream<AuthState> _mapSignUpSubmitToState(String email,String password) async*{
    // print("Working here 1.5");
    // print(email);
    // print(password);
    try{
      // yield AuthSubmit();
      print("Working here 1.5");
      
      UserCredential result = await _firebaseAuthService.signUp(email, password);
      User user = result.user;
      _homeBloc.mapEventToGetData(user);
      
      yield AuthSuccess('Signed in successfully',result.user);
    }on PlatformException catch (e, s) {
      yield AuthFail(e.code);
    } catch (e, s) {
      print(e.toString());
      yield AuthFail(e.code);
      
    }
  }

}
