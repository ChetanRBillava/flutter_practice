part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenIncremented extends HomeScreenState {
  final int value;

  HomeScreenIncremented({required this.value});
}