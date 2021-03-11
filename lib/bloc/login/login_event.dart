part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

}

class LoginStart extends LoginEvent{
   @override
  List<Object> get props => [];
}


class Login extends LoginEvent{
  final String email, password;

  Login({this.email,this.password});

   @override
  List<Object> get props => [email, password];

} 