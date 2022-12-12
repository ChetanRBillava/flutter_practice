import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/images.dart';
import '../../../logic/cubit/app_theme_cubit.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return SafeArea(
            child: Scaffold(
              backgroundColor: (appThemeState as AppThemeSet).themeClass
                  .primaryColor,
              body: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Hero(
                      tag: 'logo',
                      child: Image.asset(
                          AppImages.logo
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
