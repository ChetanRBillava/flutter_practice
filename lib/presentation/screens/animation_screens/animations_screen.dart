import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/presentation/utils/custom_print.dart';
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

class _AnimationsScreenState extends State<AnimationsScreen> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Color?> colorAnimation = ColorTween(begin: Colors.white, end: const Color(
      0xff40fa31))
      .animate(animationController);
  late Animation<double> sizeAnimation;
  bool colorAnim = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 250),
        vsync: this
    );


    sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 16.sp, end: 20.sp),
    weight: 50
        ),
        TweenSequenceItem<double>(
    tween: Tween<double>(begin: 20.sp, end: 16.sp),
    weight: 50
        ),
      ]
    ).animate(animationController);

    animationController.addStatusListener((status) {
      customPrint.myCustomPrint(status);
      if(status == AnimationStatus.completed){
        setState(() {
          colorAnim = true;
        });
      }
      else{
        setState(() {
          colorAnim = false;
        });
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
    builder: (context, appThemeState) {
        return SafeArea(
            child: Scaffold(
              backgroundColor:(appThemeState as AppThemeSet).themeClass.backgroundColor,
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
              floatingActionButton: GestureDetector(
                onDoubleTap: (){
                  if(colorAnim){
                    animationController.reverse();
                  }
                  else{
                    animationController.forward();
                  }
                },
                child: FloatingActionButton(
                  heroTag: 'logo',
                    backgroundColor: (appThemeState).themeClass.primaryColor,
                    child: Image.asset(
                        appThemeState.brightness==Brightness.light?AppImages.logo:AppImages.logoDark,
                        height: 10.h,
                        fit: BoxFit.fitHeight
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRouter.logo);
                    }

                ),
              ),
              drawer: const SideDrawer(),
              body: AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget? child) {
                  return Column(
                    children: [
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 1000),
                        builder: (BuildContext context, double value, Widget? child) {
                          return Opacity(
                            opacity: value,
                            child: child,
                          );
                        },
                        child: ListTile(
                          title:
                          AppTexts(
                            textString: 'Single tap',
                            textFontSize: sizeAnimation.value,
                            fontWeight: FontWeight.bold,
                            textColor: colorAnimation.value,
                          ),
                          subtitle: AppTexts(
                            textString: 'Tap once on the button for logo animation',
                            textFontSize: 10.0.sp,
                            fontWeight: FontWeight.bold,
                            textColor: (appThemeState).themeClass.textColor_1,
                          ),
                        ),
                      ),
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 1000),
                        builder: (BuildContext context, double value, Widget? child) {
                          return Opacity(
                            opacity: value,
                            child: child,
                          );
                        },
                        child: ListTile(
                          title:
                          AppTexts(
                            textString: 'Double tap',
                            textFontSize: sizeAnimation.value,
                            fontWeight: FontWeight.bold,
                            textColor: colorAnimation.value,
                          ),
                          subtitle: AppTexts(
                            textString: 'Double tap on the button for size and color animation',
                            textFontSize: 10.0.sp,
                            fontWeight: FontWeight.bold,
                            textColor: (appThemeState).themeClass.textColor_1,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
        );
      },
    );
  }
}
