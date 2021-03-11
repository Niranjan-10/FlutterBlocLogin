part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}


class AuthSignUp extends AuthEvent{
  final String email;
  final String password;

  AuthSignUp({this.email,this.password});

  @override
  List<Object> get props => [];

  @override
  String toString()=>"Inside Auth SignUp Event ${this.email} and password ${this.password}";

}