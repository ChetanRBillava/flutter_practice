import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/themes/app_theme.dart';
import 'package:flutter_practice/logic/cubit/app_theme_cubit.dart';
import 'package:flutter_practice/logic/cubit/internet_cubit.dart';
import 'package:flutter_practice/presentation/utils/app_texts.dart';
import 'package:flutter_practice/presentation/widgets/sidebar.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/images.dart';
import '../../core/localisations/languages.dart';
import '../../logic/cubit/home_screen_cubit.dart';
import '../router/app_router.dart';
import '../utils/custom_print.dart';
import '../widgets/app_bar_widget.dart';
import '../utils/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 2), (){
        BlocProvider.of<HomeScreenCubit>(context).animate();
      });
    });
    super.initState();
  }
  Widget willPopScope() {
    return WillPopScope(
        onWillPop: onWillPopS,
        child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, homeScreenState) {
            return BlocBuilder<AppThemeCubit, AppThemeState>(
              builder: (context, appThemeState) {
                return SafeArea(
                  child: Scaffold(
                    backgroundColor:(appThemeState as AppThemeSet).themeClass.backgroundColor,
                    appBar: homeScreenState.animated?AppBarWidget(
                        title: Languages.of(context)?.home as String,
                        centerTitle: false, automaticallyImplyLeading:true,

                        actions: [
                          Image.asset(
                            appThemeState.brightness==Brightness.light?AppImages.logo:AppImages.logoDark,
                            width: 15.w,
                            fit: BoxFit.fitWidth,
                          )
                        ]
                    ):
                    const PreferredSize(
                        preferredSize: Size.fromHeight(0),
                        child: SizedBox.shrink()
                    ),
                    drawer: const SideDrawer(),
                    body: SizedBox(
                      width: 100.w,
                      height: 100.h,
                      child: Stack(
                        children: [
                          ///network state
                          homeScreenState.animated?BlocBuilder<InternetCubit, InternetState>(
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AppTexts(
                                      textString: (state is InternetConnected && state.connectionState=='wifi')?
                                      Languages.of(context)?.wifiConnected as String:
                                      (state is InternetConnected && state.connectionState=='mobile')?
                                      Languages.of(context)?.mobileNetworkConnected as String:
                                      Languages.of(context)?.noInternet as String,
                                      textFontSize: 16.sp,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 4.w),
                                      child: Icon(
                                        state.connectionStateIcon,
                                        color: (appThemeState).themeClass.textColor_1,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ):Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Hero(
                                tag: 'logo',
                                child: Image.asset(
                                  appThemeState.brightness==Brightness.light?AppImages.logo:AppImages.logoDark,
                                  width: 15.w,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                          ///counter
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                AppTexts(
                                  textString: Languages.of(context)?.homeLabel as String,
                                ),
                                AppTexts(
                                  textString: (homeScreenState is HomeScreenIncremented)?(homeScreenState).value.toString():'0', textFontSize: 25.sp,
                                )
                              ],
                            ),
                          ),
                          ///button
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              child: CustomButton(
                                //buttonTextColor: AppTheme.textColor_2,
                                iconData: Icons.add,
                                iconColor: (appThemeState).themeClass.textColor_1,
                                buttonColor: (appThemeState).themeClass.buttonBackgroundColor,
                                buttonSize: 60.w,
                                borderRadius: 3.w,
                                fontWeight: FontWeight.bold,
                                onTapEvent: (){
                                  if(homeScreenState is HomeScreenInitial){
                                    BlocProvider.of<HomeScreenCubit>(context).incrementer(0);
                                  }
                                  else{
                                    BlocProvider.of<HomeScreenCubit>(context).incrementer((homeScreenState as HomeScreenIncremented).value);
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        )
    );
  }


  DateTime? currentBackPressTime;
  Future<bool> onWillPopS() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Press again to exit'),
          )
      );
      return Future.value(false);
    }
    else{
      SystemNavigator.pop();
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return willPopScope();
  }
}