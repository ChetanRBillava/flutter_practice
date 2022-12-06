import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/presentation/utils/app_texts.dart';
import 'package:sizer/sizer.dart';

import '../../core/localisations/languages.dart';
import '../../core/themes/app_theme.dart';
import '../../data/models/random_jokes_model.dart';
import '../../logic/cubit/internet_cubit.dart';
import '../../logic/cubit/random_jokes_cubit.dart';
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
        floatingActionButton: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            return FloatingActionButton(
                child: const Icon(Icons.emoji_emotions),
                onPressed: (){
    /*var temp ={
                    {'id': 1,'type': 'none', 'setup':'none', 'punchline':'none'},
                  };
                  temp={};
                  temp.add({
                    'id':1,
                    'type':'general',
                    'setup':'Setup',
                    'punchline':'Punchline',
                  });
                  temp.map((e) => RandomJokesList.fromJson(e)).toList();
                  print(temp);*/

                  if(state is InternetDisconnected){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text('No internet connection'),
                        )
                    );
                  }else{
                    BlocProvider.of<RandomJokesCubit>(context).fetchJokes();
                  }
                }
            );
          },
        ),
        body: BlocConsumer<RandomJokesCubit, RandomJokesState>(
          listener: (context, state) {
            if(state is RandomJokesInitialError){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 2),
                    content: Text(state.errorMessage),
                  )
              );
            }
            else if(state is RandomJokesLoadedError){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 2),
                    content: Text(state.errorMessage),
                  )
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: state is RandomJokesInitial?AppTexts(
                    textString: Languages.of(context)?.jokeMessage as String,
                    textFontSize: 20.sp,
                    textAlign: TextAlign.center,
                  ):
                  Column(
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
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: state.isLoading?const CircularProgressIndicator():const SizedBox.shrink()
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}