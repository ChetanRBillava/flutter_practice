import 'package:flutter/material.dart';

import '../../core/constants/bools.dart';

class CustomPrint {
  ///print data is the data to be printed
  ///super print is the optional variable which on set to true, displays the data irrespective of the state of debugMode but under the condition that the super print mode is set to true
  void myCustomPrint(printData, [bool superPrint = false]) {
    if(Booleans.inDebugMode){
      ///prints data only if debug mode is on
      print(printData);
    }
    else if(Booleans.superPrintMode&&superPrint){
      ///prints data only if super print boolean and super print mode a-re both set to true
      print(printData);
    }
  }
}

CustomPrint customPrint = CustomPrint();
///the object of the custom print class is declared here so that the same object can be accessed throughout the app process