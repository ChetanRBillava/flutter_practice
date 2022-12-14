part of 'home_screen_cubit.dart';

class HomeScreenState extends Equatable{
  final bool animated;
  const HomeScreenState({required this.animated});
  @override
  List<Object> get props => [animated];

}

class HomeScreenInitial extends HomeScreenState {
  const HomeScreenInitial({required super.animated});


  @override
  List<Object> get props => [];

}

class HomeScreenIncremented extends HomeScreenState {
  final int value;

  const HomeScreenIncremented({required super.animated, required this.value});

  @override
  List<Object> get props => [value];
}