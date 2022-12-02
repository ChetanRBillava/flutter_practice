part of 'my_form_cubit.dart';

@immutable
abstract class MyFormState {}

class MyFormDetails extends MyFormState {
  String name, gender, password;
  int exp;

  String heading, subHeading;
  int timer;
  bool visible;

  MyFormDetails({
    required this.name,
    required this.gender,
    required this.password,
    required this.exp,

    required this.heading,
    required this.subHeading,
    required this.timer,
    required this.visible,
  });
}
