import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/logic/cubit/random_jokes__cubit.dart';
import 'package:flutter_practice/presentation/utils/app_texts.dart';
import 'package:sizer/sizer.dart';

import '../../core/localisations/languages.dart';
import '../../core/themes/app_theme.dart';
import '../widgets/app_bar_widget.dart';
import '../utils/custom_button.dart';
import '../widgets/sidebar.dart';

class RandomJokesScreen extends StatefulWidget {
  const RandomJokesScreen({Key? key}) : super(key: key);

  @override
  State<RandomJokesScreen> createState() => _RandomJokesScreenState();
}

class _RandomJokesScreenState extends State<RandomJokesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBarWidget(title: Languages.of(context)?.jokes as String,
            centerTitle: false,
            automaticallyImplyLeading: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                      Icons.arrow_back
                  ),
                ),
              )
            ]
        ),
        drawer: const SideDrawer(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.emoji_emotions),
            onPressed: (){
              BlocProvider.of<RandomJokesCubit>(context).fetchJokes(context);
            }
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: BlocBuilder<RandomJokesCubit, RandomJokesState>(
                builder: (context, state) {
                  if(state is RandomJokesInitial){
                    return AppTexts(
                      textString: Languages.of(context)?.jokeMessage as String,
                      textFontSize: 20.sp,
                      textAlign: TextAlign.center,
                    );
                  }
                  else{
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: AppTexts(
                            textString: (state as RandomJokesLoaded).randomJokesList[0].type.toUpperCase(),
                            textColor: AppTheme.textCaptionColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: AppTexts(
                            textString: (state).randomJokesList[0].setup,
                            textFontSize: 22.sp,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: AppTexts(
                            textString: (state).randomJokesList[0].punchline,
                            textFontSize: 36.sp,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: BlocBuilder<RandomJokesCubit, RandomJokesState>(
                builder: (context, state) {
                  if(state is RandomJokesInitial && state.isLoading){
                    return const CircularProgressIndicator();
                  }
                  else if(state is RandomJokesLoaded && state.isLoading){
                    return const CircularProgressIndicator();
                  }
                  else{
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
