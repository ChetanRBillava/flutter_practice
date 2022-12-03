import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/logic/cubit/home_screen_cubit.dart';
import 'package:flutter_practice/logic/cubit/my_form_cubit.dart';
import 'package:flutter_practice/logic/cubit/random_jokes__cubit.dart';
import 'package:flutter_practice/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/constants/strings.dart';
import 'core/localisations/appLocalizationsDelegate.dart';
import 'core/localisations/languages.dart';
import 'data/repositories/random_jokes_repository.dart';
import 'logic/bloc/calculator_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RandomJokesRepository randomJokesRepository = RandomJokesRepository();
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

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
          create: (context) => MyFormCubit(),
        ),
        BlocProvider(
          create: (context) => CalculatorBloc(),
        ),
      ],
      child: Sizer(builder: (context, constraints, orientation) {
        return MaterialApp(
          title: Strings.appTitle,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.splash,
          onGenerateRoute: AppRouter.onGenerateRoute,
          locale: _locale,
          supportedLocales: const [
            Locale('en', ''),
            Locale('hi', ''),
            Locale('ka', ''),
          ],
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        );
      }),
    );
  }
}

