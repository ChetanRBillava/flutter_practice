part of 'voice_assistant_bloc.dart';

class VoiceAssistantEvent extends Equatable {
  const VoiceAssistantEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SpeechInitialise extends VoiceAssistantEvent{

}

class SpeechGreeting extends VoiceAssistantEvent{

}

class SpeechInput extends VoiceAssistantEvent{

}

class SpeechOutput extends VoiceAssistantEvent{
  final String result;
  const SpeechOutput({required this.result});

  @override
  // TODO: implement props
  List<Object> get props => [result];
}

class SpeechNoResponse extends VoiceAssistantEvent{

}

class SpeechStop extends VoiceAssistantEvent{

}

class SpeechGuide extends VoiceAssistantEvent{

}