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

class RandomJokesInitialError extends RandomJokesInitial {
  final String errorCode, errorMessage;
  RandomJokesInitialError({required super.isLoading, required this.errorCode, required this.errorMessage});
}

class RandomJokesLoaded extends RandomJokesState{
  List<RandomJokesList> randomJokesList;
  RandomJokesLoaded({required super.isLoading, required this.randomJokesList});
}

class RandomJokesLoadedError extends RandomJokesLoaded{
  final String errorCode, errorMessage;
  RandomJokesLoadedError({required super.isLoading, required super.randomJokesList,
  required this.errorCode, required this.errorMessage});
}
