import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_practice/logic/cubit/home_screen_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group('Home screen cubit test', (){
    HomeScreenCubit? homeScreenCubit;

    setUp((){
      homeScreenCubit = HomeScreenCubit();
    });

    tearDown((){
      homeScreenCubit?.close();
    });


    test('the initial state is Home screen initial state', (){
      expect(homeScreenCubit?.state, const HomeScreenInitial(animated: false));
    });

    blocTest<HomeScreenCubit, HomeScreenState>(
      'Home screen incrementer function',
      build: () => HomeScreenCubit(),
      act: (cubit) => cubit.incrementer(1),
      expect: () => [const HomeScreenIncremented(value: 2, animated: false)],
    );
  });

}