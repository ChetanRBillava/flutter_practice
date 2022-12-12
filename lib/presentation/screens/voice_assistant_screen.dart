import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/logic/bloc/voice_assistant_bloc.dart';
import 'package:flutter_practice/logic/bloc/voice_assistant_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../../core/localisations/languages.dart';
import '../../logic/cubit/app_theme_cubit.dart';
import '../router/app_router.dart';
import '../utils/app_texts.dart';
import '../utils/custom_print.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/sidebar.dart';

class VoiceAssistantScreen extends StatefulWidget {
  const VoiceAssistantScreen({Key? key}) : super(key: key);

  @override
  State<VoiceAssistantScreen> createState() => _VoiceAssistantScreenState();
}

class _VoiceAssistantScreenState extends State<VoiceAssistantScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return BlocConsumer<VoiceAssistantBloc, VoiceAssistantState>(
          listener: (context, vaState) {
            // TODO: implement listener
            customPrint.myCustomPrint(vaState);
            if(vaState is VoiceAssistantResult){
              List<String> commands = ['home'];
              TextToSpeech tts = TextToSpeech();
              if(vaState.speechValue == 'home'){
                tts.speak('In a moment');
                Navigator.of(context).pushNamed(AppRouter.home);
              }
              else if(vaState.speechValue == 'calculator'){
                tts.speak('In a moment');
                Navigator.of(context).pushNamed(AppRouter.calc);
              }
              else if(vaState.speechValue == 'jokes'){
                tts.speak('In a moment');
                Navigator.of(context).pushNamed(AppRouter.randomJokes);
              }
              else if(vaState.speechValue == 'form'){
                tts.speak('In a moment');
                Navigator.of(context).pushNamed(AppRouter.myForm);
              }
              else if(vaState.speechValue == 'language'){
                tts.speak('In a moment');
                Navigator.of(context).pushNamed(AppRouter.lang);
              }
              else if(vaState.speechValue == 'theme'){
                tts.speak('In a moment');
                Navigator.of(context).pushNamed(AppRouter.theme);
              }
              else if(vaState.speechValue == 'guide'){
                BlocProvider.of<VoiceAssistantBloc>(context).add(SpeechGuide());
              }
              else {
                tts.speak('Did you say ${vaState.speechValue}');
              }
            }
          },
          builder: (context, vaState) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: (appThemeState as AppThemeSet).themeClass.backgroundColor,
                appBar: AppBarWidget(title: Languages.of(context)?.va as String, centerTitle: false, automaticallyImplyLeading:true,
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
                    ]),
                drawer: const SideDrawer(),
                floatingActionButton: vaState is VoiceAssistantListening?const SizedBox.shrink():FloatingActionButton(
                    backgroundColor: (appThemeState).themeClass.primaryColor,
                    child: Icon(Icons.mic, color:(appThemeState).themeClass.textColor_1,),
                    onPressed: (){
                      if(vaState is VoiceAssistantListening){
                        BlocProvider.of<VoiceAssistantBloc>(context).add(SpeechStop());
                      }
                      else{
                        BlocProvider.of<VoiceAssistantBloc>(context).add(SpeechInput());
                      }
                    }
                ),
                body: vaState is VoiceAssistantInitial?Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: AppTexts(
                        textString: 'Say something into the mic',
                        textFontSize: 36.sp,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: AppTexts(
                        textString: 'Try saying \'GUIDE\'',
                        textFontSize: 16.sp,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ):
                vaState is VoiceAssistantResult?Center(
                  child: Padding(
                    padding: EdgeInsets.all(1.h),
                    child: AppTexts(
                      textString: vaState.speechValue,
                      textFontSize: 36.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ):
                vaState is VoiceAssistantListening?Center(
                  child: GestureDetector(
                    onTap: (){
                      BlocProvider.of<VoiceAssistantBloc>(context).add(SpeechStop());
                    },
                    child: AvatarGlow(
                      endRadius: 25.w,
                      glowColor: (appThemeState).themeClass.textCaptionColor,
                      child: Material(
                        elevation: 8.0,
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: (appThemeState).themeClass.primaryColor,
                          radius: 30.0,
                          child: Icon(
                            Icons.mic, color:(appThemeState).themeClass.textColor_1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ):
                vaState is VoiceAssistantGuide?Column(
                  children: [
                    ///home
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 1000),
                      builder: (BuildContext context, double value, Widget? child) {
                        return Opacity(
                          opacity: value,
                          child: child,
                        );
                      },
                      child: ListTile(
                        title:
                        AppTexts(
                          textString: 'HOME',
                          textFontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (appThemeState).themeClass.textColor_1,
                        ),
                        subtitle: AppTexts(
                          textString: 'Say HOME to navigate to Home screen',
                          textFontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (appThemeState).themeClass.textColor_1,
                        ),
                      ),
                    ),
                    ///calc
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 1400),
                      builder: (BuildContext context, double value, Widget? child) {
                        return Opacity(
                          opacity: value,
                          child: child,
                        );
                      },
                      child: ListTile(
                        title:
                        AppTexts(
                          textString: 'CALCULATOR',
                          textFontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (appThemeState).themeClass.textColor_1,
                        ),
                        subtitle: AppTexts(
                          textString: 'Say CALCULATOR to navigate to Calculator screen',
                          textFontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (appThemeState).themeClass.textColor_1,
                        ),
                      ),
                    ),
                    ///jokes
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 1800),
                      builder: (BuildContext context, double value, Widget? child) {
                        return Opacity(
                          opacity: value,
                          child: child,
                        );
                      },
                      child: ListTile(
                        title:
                        AppTexts(
                          textString: 'JOKES',
                          textFontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (appThemeState).themeClass.textColor_1,
                        ),
                        subtitle: AppTexts(
                          textString: 'Say JOKES to navigate to Jokes screen',
                          textFontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (appThemeState).themeClass.textColor_1,
                        ),
                      ),
                    ),
                    ///form
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 2200),
                      builder: (BuildContext context, double value, Widget? child) {
                        return Opacity(
                          opacity: value,
                          child: child,
                        );
                      },
                      child: ListTile(
                        title:
                        AppTexts(
                          textString: 'FORM',
                          textFontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (appThemeState).themeClass.textColor_1,
                        ),
                        subtitle: AppTexts(
                          textString: 'Say FORM to navigate to FORM screen',
                          textFontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (appThemeState).themeClass.textColor_1,
                        ),
                      ),
                    ),
                    ///lang
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 2600),
                      builder: (BuildContext context, double value, Widget? child) {
                        return Opacity(
                          opacity: value,
                          child: child,
                        );
                      },
                      child: ListTile(
                        title:
                        AppTexts(
                          textString: 'LANGUAGE',
                          textFontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (appThemeState).themeClass.textColor_1,
                        ),
                        subtitle: AppTexts(
                          textString: 'Say LANGUAGE to navigate to Language screen',
                          textFontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (appThemeState).themeClass.textColor_1,
                        ),
                      ),
                    ),
                    ///theme
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 3000),
                      builder: (BuildContext context, double value, Widget? child) {
                        return Opacity(
                          opacity: value,
                          child: child,
                        );
                      },
                      child: ListTile(
                        title:
                        AppTexts(
                          textString: 'THEME',
                          textFontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (appThemeState).themeClass.textColor_1,
                        ),
                        subtitle: AppTexts(
                          textString: 'Say THEME to navigate to Theme screen',
                          textFontSize: 12.0.sp,
                          fontWeight: FontWeight.bold,
                          textColor: (appThemeState).themeClass.textColor_1,
                        ),
                      ),
                    ),
                  ],
                ):const SizedBox.shrink(),
              ),
            );
          },
        );
      },
    );
  }
}
