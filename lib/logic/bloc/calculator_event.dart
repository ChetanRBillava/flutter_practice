part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class ClearScreenEvent extends CalculatorEvent{

}


class AppendNumberEvent extends CalculatorEvent{
  final String value;

  AppendNumberEvent({required this.value});
}


class GetResultEvent extends CalculatorEvent{

  GetResultEvent();
}


class BackspaceEvent extends CalculatorEvent{

}