import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/presentation/utils/custom_print.dart';
import 'package:meta/meta.dart';
import 'package:sizer/sizer.dart';

import '../../data/models/random_jokes_model.dart';
import '../../data/repositories/random_jokes_repository.dart';

part 'random_jokes__state.dart';

class RandomJokesCubit extends Cubit<RandomJokesState> {
  final RandomJokesRepository repository;
  RandomJokesCubit({required this.repository}) : super(RandomJokesInitial(isLoading: false));

  void fetchJokes(context){
    if(state is RandomJokesInitial){
      emit(RandomJokesInitial(isLoading: true));
    }
    else{
      emit(RandomJokesLoaded(isLoading: true, randomJokesList: (state as RandomJokesLoaded).randomJokesList));
    }

    repository.fetchJokesAPI().then((randomJokesList) {
      if(randomJokesList.isEmpty){
        emit(RandomJokesLoaded(isLoading: false, randomJokesList: (state as RandomJokesLoaded).randomJokesList));

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 3),
              content: Row(
                children: [
                  const Icon(
                    Icons.report_problem,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  const Text('Failed to load new joke'),
                ],
              ),
            )
        );
      }
      else{
        emit(RandomJokesLoaded(isLoading: false, randomJokesList: randomJokesList));
      }
    });
  }
}
