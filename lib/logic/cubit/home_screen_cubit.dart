import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../presentation/utils/custom_print.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  void incrementer(int num){
    customPrint.myCustomPrint(num+1);

    emit(HomeScreenIncremented(value: num+1));
  }
}
