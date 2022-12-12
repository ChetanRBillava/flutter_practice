import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/images.dart';
import '../../../core/localisations/languages.dart';
import '../../../logic/cubit/app_theme_cubit.dart';
import '../../router/app_router.dart';
import '../../utils/app_texts.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/sidebar.dart';

class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({Key? key}) : super(key: key);

  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
    builder: (context, appThemeState) {
        return SafeArea(
            child: Scaffold(
              appBar: AppBarWidget(title: Languages.of(context)?.anim as String, centerTitle: false, automaticallyImplyLeading:true,
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
                  ]),
              floatingActionButton: FloatingActionButton(
                heroTag: 'logo',
                  backgroundColor: (appThemeState as AppThemeSet).themeClass.primaryColor,
                  child: Image.asset(
                      appThemeState.brightness==Brightness.light?AppImages.logo:AppImages.logoDark,
                      height: 10.h,
                      fit: BoxFit.fitHeight
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRouter.logo);
                  }
              ),
              drawer: const SideDrawer(),
              body: Center(
                child:
                AppTexts(
                  textString: Languages.of(context)?.anim as String,
                  textFontSize: 30.0.sp,
                  fontWeight: FontWeight.bold,
                  //textColor: (appThemeState).themeClass.textColor_1,
                ),
              ),
            )
        );
      },
    );
  }
}
