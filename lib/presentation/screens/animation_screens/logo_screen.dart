import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/images.dart';
import '../../../logic/cubit/app_theme_cubit.dart';
import '../../widgets/app_bar_widget.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  bool display = false;

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () {
      setState(() {
        display = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return SafeArea(
            child: Scaffold(
              backgroundColor: (appThemeState as AppThemeSet).themeClass
                  .primaryColor,
              ///auto popup app bar
              appBar: display?AppBarWidget(title: 'Logo screen', centerTitle: false,
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 2.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                            Icons.arrow_back
                        ),
                      ),
                    )
                  ]):const PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: SizedBox.shrink()
              ),
              body: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Hero(
                      tag: 'logo',
                      child: Image.asset(
                        appThemeState.brightness==Brightness.light?AppImages.logo:AppImages.logoDark,
                      )
                  ),
                ),
              ),
            )
        );
      },
    );
  }
}
