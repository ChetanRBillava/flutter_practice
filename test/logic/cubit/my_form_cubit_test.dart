import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_practice/logic/cubit/home_screen_cubit.dart';
import 'package:flutter_practice/logic/cubit/my_form_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group('My form screen cubit test', (){
    MyFormCubit? homeScreenCubit;

    setUp((){
      homeScreenCubit = MyFormCubit();
    });

    tearDown((){
      homeScreenCubit?.close();
    });


    test('The initial state of the form screen', (){
      expect(homeScreenCubit?.state, (MyFormDetails(
          name: 'John Doe', gender: 'Male', password: 'PASSWORD', exp: 0,
          heading: 'Greetings Mr. John Doe', subHeading: 'Thank you for installing this app', timer: 5, visible: false
      )));
    });

    blocTest<MyFormCubit, MyFormState>(
      'The function to change the name',
      build: () => MyFormCubit(),
      act: (cubit) => cubit.setName('Chetan'),
      expect: () => <MyFormState>[
        MyFormDetails(
            name: 'Chetan', gender: 'Male', password: 'PASSWORD', exp: 0,
            heading: 'Greetings Mr. John Doe', subHeading: 'Thank you for installing this app', timer: 5, visible: false
        )
      ],
    );

    blocTest<MyFormCubit, MyFormState>(
      'The function to values(Male & exp = 0)',
      build: () => MyFormCubit(),
      act: (cubit) => cubit.setValues('Chetan', 'Male', 'Test@123', 0),
      expect: () => <MyFormState>[
        MyFormDetails(
            name: 'Chetan', gender: 'Male', password: 'Test@123', exp: 0,
            heading: 'Greetings Mr. Chetan', subHeading: 'Thank you for installing this app!', timer: 5, visible: false
        )
      ],
    );

    blocTest<MyFormCubit, MyFormState>(
      'The function to values(Male & exp = 1)',
      build: () => MyFormCubit(),
      act: (cubit) => cubit.setValues('Chetan', 'Male', 'Test@123', 1),
      expect: () => <MyFormState>[
        MyFormDetails(
            name: 'Chetan', gender: 'Male', password: 'Test@123', exp: 1,
            heading: 'Greetings Mr. Chetan', subHeading: 'Thank you for visiting again', timer: 5, visible: false
        )
      ],
    );

    blocTest<MyFormCubit, MyFormState>(
      'The function to values(Female & exp = 0)',
      build: () => MyFormCubit(),
      act: (cubit) => cubit.setValues('Chaitra', 'Female', 'Test@123', 0),
      expect: () => <MyFormState>[
        MyFormDetails(
            name: 'Chaitra', gender: 'Female', password: 'Test@123', exp: 0,
            heading: 'Greetings Miss/Mrs. Chaitra', subHeading: 'Thank you for installing this app!', timer: 5, visible: false
        )
      ],
    );

    blocTest<MyFormCubit, MyFormState>(
      'The function to values(Female & exp = 1)',
      build: () => MyFormCubit(),
      act: (cubit) => cubit.setValues('Chaitra', 'Female', 'Test@123', 1),
      expect: () => <MyFormState>[
        MyFormDetails(
            name: 'Chaitra', gender: 'Female', password: 'Test@123', exp: 1,
            heading: 'Greetings Miss/Mrs. Chaitra', subHeading: 'Thank you for visiting again', timer: 5, visible: false
        )
      ],
    );

    blocTest<MyFormCubit, MyFormState>(
      'The function to start timer',
      build: () => MyFormCubit(),
      act: (cubit) => cubit.updateTimer(true),
      expect: () => <MyFormState>[
        MyFormDetails(
            name: 'John Doe', gender: 'Male', password: 'PASSWORD', exp: 0,
            heading: 'Greetings Mr. John Doe', subHeading: 'Thank you for installing this app', timer: 4, visible: true
        )
      ],
    );

    blocTest<MyFormCubit, MyFormState>(
      'The function to stop timer',
      build: () => MyFormCubit(),
      act: (cubit) => cubit.updateTimer(false),
      expect: () => <MyFormState>[
        MyFormDetails(
            name: 'John Doe', gender: 'Male', password: 'PASSWORD', exp: 0,
            heading: 'Greetings Mr. John Doe', subHeading: 'Thank you for installing this app', timer: 0, visible: false
        )
      ],
    );
  });

}