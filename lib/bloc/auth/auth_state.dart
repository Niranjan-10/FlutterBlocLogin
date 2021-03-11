part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];

  @override
  String toString()=>"Inside Auth initial state";
}

class AuthSubmit extends AuthState{
  @override
  List<Object> get props => [];

}

class AuthSuccess extends AuthState {
  final String message;
  final User user;

  AuthSuccess(this.message,this.user);

  @override
  List<Object> get props => [];

  @override
  String toString()=>"Inside Auth success state";
}

class AuthFail extends AuthState{
  final String message;
  AuthFail(this.message);

  @override
  List<Object> get props => [];

  @override
  String toString()=>"Inside Auth failed state";

}