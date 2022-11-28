part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState {
  final String value;
  const CalculatorState({required this.value});
}

class CalculatorInitial extends CalculatorState {
  const CalculatorInitial({required super.value});
}

class CalculatorTyping extends CalculatorState {
  final String valueString;
  const CalculatorTyping({required super.value, required this.valueString});
}

class CalculatorResult extends CalculatorState {
  const CalculatorResult({required super.value});
}