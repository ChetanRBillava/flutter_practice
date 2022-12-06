part of 'home_screen_cubit.dart';

class HomeScreenState extends Equatable{

  @override
  List<Object> get props => [];

}

class HomeScreenInitial extends HomeScreenState {

  @override
  List<Object> get props => [];

}

class HomeScreenIncremented extends HomeScreenState {
  final int value;

  HomeScreenIncremented({required this.value});

  @override
  List<Object> get props => [value];
}