import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/themes/app_theme.dart';
import '../../logic/cubit/app_theme_cubit.dart';
import '../utils/app_texts.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  AppBarWidget({
    Key? key,
    required this.title,

    this.automaticallyImplyLeading,
    this.actions,
    this.centerTitle,
  }) : super(key: key);

  ///required
  String title;

  ///optional
  bool? automaticallyImplyLeading, centerTitle;
  List<Widget>? actions;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return AppBar(
          iconTheme: IconThemeData(
            color: (appThemeState as AppThemeSet).themeClass.textColor_1, // <-- SEE HERE
          ),
          backgroundColor: (appThemeState).themeClass.appbarBackgroundColor,
          automaticallyImplyLeading: widget.automaticallyImplyLeading ?? true,
          centerTitle: widget.centerTitle ?? true,
          actions: widget.actions,
          title: AppTexts(
            textString: widget.title,
            fontWeight: FontWeight.bold,
            textColor: (appThemeState).themeClass.textColor_1,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}