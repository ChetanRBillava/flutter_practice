import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../presentation/utils/custom_print.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  void incrementer(){
    customPrint.myCustomPrint('Inside cubit');
    int newVal = 0;

    if(state is HomeScreenIncremented){
      newVal = (state as HomeScreenIncremented).value;
    }

    emit(HomeScreenIncremented(value: newVal+1));
  }
}
