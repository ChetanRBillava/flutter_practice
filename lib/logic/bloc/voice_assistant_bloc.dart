import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../../core/localisations/locale_constant.dart';
import '../../presentation/utils/custom_print.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

part 'voice_assistant_event.dart';
part 'voice_assistant_state.dart';

class VoiceAssistantBloc extends Bloc<VoiceAssistantEvent, VoiceAssistantState> {
  final SpeechToText speechToText = SpeechToText();
  TextToSpeech tts = TextToSpeech();
  VoiceAssistantBloc() : super(VoiceAssistantInitial()) {
    on<VoiceAssistantEvent>((event, emit) async {
      // TODO: implement event handler
      if(event is SpeechInitialise){
        bool speechEnabled = false;
        customPrint.myCustomPrint('Initialising speech');
        speechEnabled = await speechToText.initialize();
        customPrint.myCustomPrint('Speech enabled $speechEnabled');
        add(SpeechGreeting());
      }
      else if(event is SpeechGreeting){
        Locale? selectedLocale;
        List<String> speechLang = [];
        speechLang = await tts.getLanguages();
        customPrint.myCustomPrint('Speech languages $speechLang');
        selectedLocale = await getLocale();
        if(selectedLocale.languageCode == 'hi'){
          tts.setLanguage('hi-IN');
          tts.speak('आपका दिन शुभ हो');
        }
        else if(selectedLocale.languageCode == 'kn'){
          tts.setLanguage('kn-IN');
          tts.speak('ನಿಮ್ಮ ದಿನಾ ಶುಭವಾಗಲಿ');
        }
        else{
          tts.setLanguage('en-IN');
          tts.speak('Have a good day');
        }
      }
      else if(event is SpeechInput){
        final SpeechToText speechToText2 = SpeechToText();
        customPrint.myCustomPrint('Listening ${speechToText2.isListening}');
        //speechToText.stop();
        emit(VoiceAssistantListening());
        String speechResult = '';
        int seconds = 0;
        Timer.periodic(const Duration(seconds:1), (Timer t) {
          seconds++;
          customPrint.myCustomPrint(state);
          customPrint.myCustomPrint(seconds);


          if(state is! VoiceAssistantListening){
            t.cancel();
          }
          else if(seconds == 5 && state is VoiceAssistantListening){
            t.cancel();
            add(SpeechNoResponse());
          }
        });
        await speechToText2.listen(
            listenFor: const Duration(seconds: 5),
            onResult: (SpeechRecognitionResult result){
              if(result.finalResult){
                speechResult = result.recognizedWords;
                add(SpeechOutput(result: speechResult));
              }
            });
      }
      else if(event is SpeechOutput){
        customPrint.myCustomPrint('Speech output result ${event.result}');
        emit(VoiceAssistantResult(speechValue: event.result));
      }
      else if(event is SpeechNoResponse){
        customPrint.myCustomPrint('No response');
        emit(VoiceAssistantInitial());
      }
      else if(event is SpeechStop){
        speechToText.stop();
        customPrint.myCustomPrint('Speech stopped');
        emit(VoiceAssistantInitial());
      }
      else if(event is SpeechGuide){
        emit(VoiceAssistantGuide());
      }
    });
  }
}
