part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSubmit extends LoginState{
@override
  List<Object> get props => [];
}

class LoginSucess extends LoginState{
final String message;
final User user;

LoginSucess(@required this.message,@required  this.user);

  @override
  List<Object> get props => [this.user,this.message];
}

class LoginFail extends LoginState{
  final String message;

  LoginFail({this.message});

  @override
  List<Object> get props => [this.message];
}