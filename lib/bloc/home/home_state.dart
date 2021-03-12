part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState{
  final User user;

  HomeSuccess({this.user});
  @override
  List<Object> get props => [this.user];
}

class HomeFailed extends HomeState{
  final String message;

  HomeFailed({this.message});

  @override
  List<Object> get props => [];
}