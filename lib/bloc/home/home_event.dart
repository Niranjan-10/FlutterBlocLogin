part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeStarted extends HomeEvent{
 
  List<Object> get props => [];

}

class Home extends HomeEvent{
  final User user;

  Home({this.user});

     @override
  List<Object> get props => [this.user]; 
}
