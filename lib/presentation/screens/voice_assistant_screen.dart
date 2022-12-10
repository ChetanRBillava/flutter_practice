import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../../core/localisations/languages.dart';
import '../../logic/cubit/app_theme_cubit.dart';
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
  final SpeechToText _speechToText = SpeechToText();
  TextToSpeech tts = TextToSpeech();
  bool _speechEnabled = false;
  String speechResult = 'Say something into the mic';

  void _startListening() async {
    customPrint.myCustomPrint('Listening');
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    if(result.finalResult){
      setState(() {
        speechResult = result.recognizedWords;
      });
      customPrint.myCustomPrint('Speech result $speechResult');
      tts.speak('Did you say $speechResult');
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
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
            floatingActionButton: FloatingActionButton(
                backgroundColor: (appThemeState).themeClass.primaryColor,
                child: Icon(Icons.mic, color:(appThemeState).themeClass.textColor_1,),
                onPressed: (){
                  _startListening();
                }
            ),
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: AppTexts(
                  textString: speechResult,
                  textFontSize: 36.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
