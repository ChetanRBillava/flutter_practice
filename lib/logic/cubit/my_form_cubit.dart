import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../presentation/widgets/dialogs.dart';

part 'my_form_state.dart';

class MyFormCubit extends Cubit<MyFormState> {
  MyFormCubit() : super(MyFormDetails(
    name: 'John Doe', gender: 'Male', password: 'PASSWORD', exp: 0,
    heading: 'Greetings Mr. John Doe', subHeading: 'Thank you for installing this app', timer: 5, visible: false
  ));

  void setName(String value){
    emit(
        MyFormDetails(
            name: value,
            gender: (state as MyFormDetails).gender,
            password: (state as MyFormDetails).password,
            exp: (state as MyFormDetails).exp,
            heading: (state as MyFormDetails).heading,
            subHeading: (state as MyFormDetails).subHeading,
            timer: (state as MyFormDetails).timer,
            visible: (state as MyFormDetails).visible,
        )
    );
  }

  Future<bool> setValues(String name, gender, password, int exp) async{
    String heading, subheading;
    if(gender == 'Male'){
      heading = 'Greetings Mr. $name';
    }
    else{
      heading = 'Greetings Miss/Mrs. $name';
    }

    if(exp == 0){
      subheading = 'Thank you for installing this app!';
    }
    else{
      subheading = 'Thank you for visiting again';
    }

    emit(
        MyFormDetails(
          name: name,
          gender: gender,
          password: password,
          exp: exp,
          heading: heading,
          subHeading: subheading,
          timer: (state as MyFormDetails).timer,
          visible: (state as MyFormDetails).visible,
        )
    );
    return true;
  }

  void updateTimer(bool visible){
    int timer = (state as MyFormDetails).timer;
    if(visible){
      timer --;

      if(timer > 0){
        emit(
            MyFormDetails(
              name: (state as MyFormDetails).name,
              gender: (state as MyFormDetails).gender,
              password: (state as MyFormDetails).password,
              exp: (state as MyFormDetails).exp,
              heading: (state as MyFormDetails).heading,
              subHeading: (state as MyFormDetails).subHeading,
              timer: timer,
              visible: visible,
            )
        );

        Timer(const Duration( seconds: 1), (){
          updateTimer(true);
        });
      }
      else{
        emit(
            MyFormDetails(
              name: (state as MyFormDetails).name,
              gender: (state as MyFormDetails).gender,
              password: (state as MyFormDetails).password,
              exp: (state as MyFormDetails).exp,
              heading: (state as MyFormDetails).heading,
              subHeading: (state as MyFormDetails).subHeading,
              timer: 5,
              visible: false,
            )
        );
      }
    }
    else{
      emit(
          MyFormDetails(
            name: (state as MyFormDetails).name,
            gender: (state as MyFormDetails).gender,
            password: (state as MyFormDetails).password,
            exp: (state as MyFormDetails).exp,
            heading: (state as MyFormDetails).heading,
            subHeading: (state as MyFormDetails).subHeading,
            timer: 0,
            visible: false,
          )
      );
    }
  }
}