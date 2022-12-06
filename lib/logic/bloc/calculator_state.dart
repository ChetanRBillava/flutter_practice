part of 'calculator_bloc.dart';

class CalculatorState extends Equatable{
  final String value;
  const CalculatorState({required this.value});

  @override
  List<Object> get props => [value];
}

class CalculatorInitial extends CalculatorState {
  const CalculatorInitial({required super.value});

  @override
  List<Object> get props => [value];
}

class CalculatorTyping extends CalculatorState {
  final String valueString;
  const CalculatorTyping({required super.value, required this.valueString});

  @override
  List<Object> get props => [value, valueString];
}

class CalculatorResult extends CalculatorState {
  const CalculatorResult({required super.value});

  @override
  List<Object> get props => [value];
}

class CalculatorInvalidFormat extends CalculatorState {
  const CalculatorInvalidFormat({required super.value});

  @override
  List<Object> get props => [value];
}