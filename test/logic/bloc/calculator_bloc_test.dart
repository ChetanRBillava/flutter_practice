import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_practice/logic/bloc/calculator_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group('Calculator bloc test', (){
    CalculatorBloc? calculatorBloc;

    setUp((){
      calculatorBloc = CalculatorBloc();
    });

    tearDown((){
      calculatorBloc?.close();
    });


    test('the initial state of calculator bloc', (){
      expect(calculatorBloc?.state, const CalculatorInitial(value: '0'));
    });

    blocTest<CalculatorBloc, CalculatorState>(
      'Clear screen event',
      build: () => CalculatorBloc(),
      act: (bloc) => bloc.add(ClearScreenEvent()),
      expect: () => [const CalculatorInitial(value: '0')],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'Append number event',
      build: () => CalculatorBloc(),
      act: (bloc) => bloc.add(AppendNumberEvent(value: '10')),
      expect: () => [const CalculatorTyping(value: '0', valueString: '10')],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'Append number event - symbol',
      build: () => CalculatorBloc(),
      act: (bloc) => bloc.add(AppendNumberEvent(value: '*')),
      expect: () => [const CalculatorTyping(value: '0', valueString: '*')],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'Append number event - zero',
      build: () => CalculatorBloc(),
      act: (bloc) => bloc.add(AppendNumberEvent(value: '0')),
      expect: () => [const CalculatorTyping(value: '0', valueString: '0')],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'Append number event - double zero',
      build: () => CalculatorBloc(),
      act: (bloc) => bloc.add(AppendNumberEvent(value: '00')),
      expect: () => [const CalculatorTyping(value: '0', valueString: '0')],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'Append number event - 100',
      build: () => CalculatorBloc(),
      act: (bloc) => bloc.add(AppendNumberEvent(value: '100')),
      expect: () => [const CalculatorTyping(value: '0', valueString: '100')],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'Backspace event',
      build: () => CalculatorBloc(),
      act: (bloc) {
        bloc.add(AppendNumberEvent(value: '10'));
        bloc.add(BackspaceEvent());
      },
      expect: () => [
        const CalculatorTyping(value: '0', valueString: '10'),
        const CalculatorTyping(value: '0', valueString: '1')
      ],
    );

    blocTest<CalculatorBloc, CalculatorState>(
      'Get result event',
      build: () => CalculatorBloc(),
      act: (bloc) {
        bloc.add(AppendNumberEvent(value: '4+2'));
        bloc.add(GetResultEvent());
      },
      expect: () => [
        const CalculatorTyping(value: '0', valueString: '4+2'),
        const CalculatorResult(value: '6.0')
      ],
    );
  });

}