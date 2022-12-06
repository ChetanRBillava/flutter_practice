import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:meta/meta.dart';

import '../../presentation/utils/custom_print.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorInitial(value: '0')) {
    on<CalculatorEvent>((event, emit) {

      if(event is ClearScreenEvent){
        emit(const CalculatorInitial(value: '0'));
      }
      else if(event is AppendNumberEvent){
        String newString='';
        if(state is CalculatorTyping){
          if((state as CalculatorTyping).valueString == '0'){
            if(event.value != '00'){
              newString = event.value;
            }
            else{
              newString = '0';
            }
          }
          else{
            newString = (state as CalculatorTyping).valueString + event.value;
          }
        }
        else if(state is CalculatorResult){
          if(event.value == '%' || event.value == '/' || event.value == '*' || event.value == '+' || event.value == '-'){
            newString = (state as CalculatorResult).value + event.value;
          }
          else{
            if(event.value =='00'){
              newString = '0';
            }
            else{
              newString = event.value;
            }
          }
        }
        else{
          if(state.value == '0' && event.value =='00'){
            newString = '0';
          }
          else{
            newString = event.value;
          }
        }
        emit(CalculatorTyping(value: state.value, valueString: newString));
      }
      else if(event is BackspaceEvent){
        if(state is CalculatorTyping){
          String newString = (state as CalculatorTyping).valueString;

          if(newString.length>1){
            newString = newString.substring(0, newString.length-1);
          }
          else{
            newString='0';
          }
          emit(CalculatorTyping(value: state.value, valueString: newString));
        }
        else if(state is CalculatorResult){
          String newString = (state as CalculatorResult).value;

          if(newString.length>1){
            newString = newString.substring(0, newString.length-1);
          }
          else{
            newString='0';
          }
          emit(CalculatorTyping(value: state.value, valueString: newString));
        }
        else if(state is CalculatorInvalidFormat){
          String newString = (state as CalculatorInvalidFormat).value;

          if(newString.length>1){
            newString = newString.substring(0, newString.length-1);
          }
          else{
            newString='0';
          }
          emit(CalculatorTyping(value: state.value, valueString: newString));
        }
      }
      else if(event is GetResultEvent){
        String expr = (state as CalculatorTyping).valueString;
        if(expr[0]=='%' || expr[expr.length-1]=='%'){
          emit(CalculatorInvalidFormat(value: (state as CalculatorTyping).valueString));
        }
        else{
          if(state is CalculatorTyping){
            ContextModel cm = ContextModel();
            Parser p = Parser();

            try {
              Expression exp = p.parse(expr);
              String result = exp.evaluate(EvaluationType.REAL, cm).toString();

              emit(CalculatorResult(value: result));
            } on Exception catch (_, e) {
              customPrint.myCustomPrint('Exception caught');
              customPrint.myCustomPrint(_);
              emit(CalculatorInvalidFormat(value: (state as CalculatorTyping).valueString));
            }
          }
        }
      }
    });
  }
}
