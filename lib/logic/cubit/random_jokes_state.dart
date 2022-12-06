// ignore_for_file: must_be_immutable

part of 'random_jokes_cubit.dart';

@immutable
abstract class RandomJokesState {
  bool isLoading;

  RandomJokesState({required this.isLoading});

}

class RandomJokesInitial extends RandomJokesState {

  RandomJokesInitial({required super.isLoading});
}

class RandomJokesLoaded extends RandomJokesState{
  List<RandomJokesList> randomJokesList;
  RandomJokesLoaded({required super.isLoading, required this.randomJokesList});
}