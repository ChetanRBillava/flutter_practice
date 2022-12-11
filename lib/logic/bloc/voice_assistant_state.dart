part of 'voice_assistant_bloc.dart';

abstract class VoiceAssistantState extends Equatable {
  const VoiceAssistantState();
}

class VoiceAssistantInitial extends VoiceAssistantState {
  @override
  List<Object> get props => [];
}

class VoiceAssistantListening extends VoiceAssistantState {
  @override
  List<Object> get props => [];
}

class VoiceAssistantGuide extends VoiceAssistantState {
  @override
  List<Object> get props => [];
}

class VoiceAssistantResult extends VoiceAssistantState {
  final String speechValue;

  const VoiceAssistantResult({required this.speechValue});
  @override
  List<Object> get props => [speechValue];
}
