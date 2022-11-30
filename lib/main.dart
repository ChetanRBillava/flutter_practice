import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/logic/cubit/home_screen_cubit.dart';
import 'package:flutter_practice/logic/cubit/random_jokes__cubit.dart';
import 'package:flutter_practice/presentation/router/app_router.dart';
import 'package:flutter_practice/presentation/screens/home_screen.dart';
import 'package:sizer/sizer.dart';

import 'core/constants/strings.dart';
import 'data/repositories/random_jokes_repository.dart';
import 'logic/bloc/calculator_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  RandomJokesRepository randomJokesRepository = RandomJokesRepository();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeScreenCubit(),
        ),
        BlocProvider(
          create: (context) => RandomJokesCubit(repository: randomJokesRepository),
        ),
        BlocProvider(
          create: (context) => CalculatorBloc(),
        ),
      ],
      child: Sizer(builder: (context, constraints, orientation) {
        return const MaterialApp(
          title: Strings.appTitle,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.splash,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      }),
    );
  }
}

