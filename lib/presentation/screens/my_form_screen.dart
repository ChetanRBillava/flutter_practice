import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/logic/cubit/my_form_cubit.dart';
import 'package:flutter_practice/presentation/utils/custom_print.dart';
import 'package:sizer/sizer.dart';

import '../../core/localisations/languages.dart';
import '../../core/themes/app_theme.dart';
import '../utils/app_texts.dart';
import '../utils/custom_button.dart';
import '../utils/custom_text_field.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/dialogs.dart';
import '../widgets/sidebar.dart';

class MyFormScreen extends StatefulWidget {
  const MyFormScreen({Key? key}) : super(key: key);

  @override
  State<MyFormScreen> createState() => _MyFormScreenState();
}

class _MyFormScreenState extends State<MyFormScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(), pswdController = TextEditingController();
  String? gender;
  bool chkbox = false, obscure = true;
  int exp = 0;

  void handleRadioChange(int value){
    setState(() {
      exp = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBarWidget(title: Languages.of(context)?.myForm as String, centerTitle: false, automaticallyImplyLeading:true),
        drawer: const SideDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Card(
                      elevation: 20,
                      color: AppTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppTheme.primaryColor, width: 1.w),
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                      child: Container(
                        width: 96.w,
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///Text field - name
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top:2.h, bottom: 1.h, left: 1.w),
                                    child: AppTexts(
                                      textString: Languages.of(context)?.formNameLabel as String,
                                      textFontSize: 14.sp,
                                      textColor: AppTheme.textColor_2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppTheme.formFieldBackgroundColor,
                                        //border: Border.all(color: AppTheme.lightParticlesColor),
                                        borderRadius: BorderRadius.all(Radius.circular(3.w))
                                    ),
                                    child: CustomTextField(
                                      controller: nameController,
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty) {
                                          return Languages.of(context)?.formFieldError as String;
                                        }
                                        return null;
                                      },
                                      hintText: Languages.of(context)?.formNameHint as String,
                                    ),
                                  ),
                                ],
                              ),

                              ///Dropdown - Gender
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top:2.h, bottom: 1.h, left: 1.w),
                                    child: AppTexts(
                                      textString: Languages.of(context)?.formGenderLabel as String,
                                      textFontSize: 14.sp,
                                      textColor: AppTheme.textColor_2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Container(
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        color: AppTheme.formFieldBackgroundColor,
                                        border: Border.all(color: AppTheme.enabledFormFieldBorderColor),
                                        borderRadius: BorderRadius.all(Radius.circular(3.w))
                                    ),
                                    padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.w, bottom: 2.w),
                                    child: DropdownButton<String>(
                                      hint: const Text('choose'),
                                      underline: const SizedBox(),
                                      items: <String>[
                                        Languages.of(context)?.formGenderMale as String,
                                        Languages.of(context)?.formGenderFemale as String
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: AppTexts(
                                            textString: value,
                                            textFontSize: 10.sp,
                                            //fontWeight: FontWeight.bold,
                                            textColor: AppTheme.textColor_1,
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (newVal) {
                                        gender=newVal!;
                                        setState(() {
                                          customPrint.myCustomPrint(gender);
                                        });
                                      },
                                      value: gender,
                                    ),
                                  ),
                                ],
                              ),

                              ///Text field - Password
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top:2.h, bottom: 1.h, left: 1.w),
                                    child: AppTexts(
                                      textString: Languages.of(context)?.formPasswordLabel as String,
                                      textFontSize: 14.sp,
                                      textColor: AppTheme.textColor_2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppTheme.formFieldBackgroundColor,
                                        //border: Border.all(color: AppTheme.lightParticlesColor),
                                        borderRadius: BorderRadius.all(Radius.circular(3.w))
                                    ),
                                    child: CustomTextField(
                                      controller: pswdController,
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty) {
                                          return Languages.of(context)?.formFieldError as String;
                                        }
                                        else if(value.length < 8){
                                          return Languages.of(context)?.formFieldError as String;
                                        }
                                        return null;
                                      },
                                      hintText: Languages.of(context)?.formPasswordHint as String,
                                      obscureText: obscure,
                                      suffixIcon: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            obscure = !obscure;
                                          });
                                        },
                                        child: Icon(
                                          obscure?Icons.visibility_off:Icons.visibility,
                                          color: AppTheme.textColor_1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              ///Radio button - Experience
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top:2.h, bottom: 1.h, left: 1.w),
                                    child: AppTexts(
                                      textString: Languages.of(context)?.formExperienceLabel as String,
                                      textFontSize: 14.sp,
                                      textColor: AppTheme.textColor_2,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          activeColor: AppTheme.textColor_2,
                                          groupValue: exp,
                                          onChanged: (val){
                                            handleRadioChange(val!);
                                          }
                                      ),
                                      AppTexts(
                                        textString: Languages.of(context)?.formExperienceFirstTime as String,
                                        textColor: AppTheme.textColor_2,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: 1,
                                          activeColor: AppTheme.textColor_2,
                                          groupValue: exp,
                                          onChanged: (val){
                                            handleRadioChange(val!);
                                          }
                                      ),
                                      AppTexts(
                                        textString: Languages.of(context)?.formExperienceUsedBefore as String,
                                        textColor: AppTheme.textColor_2,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              ///checkbox
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    chkbox = !chkbox;
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 2.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                        value: chkbox,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            chkbox = !chkbox;
                                          });
                                        },
                                      ),
                                      AppTexts(
                                        textString: Languages.of(context)?.formCheckboxLabel as String,
                                        textColor: AppTheme.textColor_2,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              ///submit
                              Padding(
                                padding: EdgeInsets.all(4.w),
                                child: CustomButton(
                                  buttonText: Languages.of(context)?.formDone as String,
                                  buttonColor: AppTheme.buttonBackgroundColor2,
                                  buttonSize: 90.w,
                                  borderRadius: 3.w,
                                  fontWeight: FontWeight.bold,
                                  onTapEvent: (){
                                    customPrint.myCustomPrint(formKey.currentState?.validate());
                                    if(formKey.currentState?.validate() == true){
                                      if(chkbox){
                                        if(gender!=null){
                                          BlocProvider.of<MyFormCubit>(context).setValues(
                                              context, nameController.text, gender, pswdController.text, exp
                                          );
                                        }
                                        else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                duration: const Duration(seconds: 2),
                                                content: Text(Languages.of(context)?.formFieldCheckboxError as String),
                                              )
                                          );
                                        }
                                      }
                                      else{
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              duration: const Duration(seconds: 2),
                                              content: Text(Languages.of(context)?.formFieldCheckboxError as String),
                                            )
                                        );
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
