import 'dart:async';

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

class _AnimationsScreenState extends State<AnimationsScreen> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController animationController;
  late Animation<Color?> colorAnimation;
  late Animation<double> sizeAnimation;
  late final Animation<double> curve;

  List animationOptionsList = [
    ['Single tap', 'Tap once on the button for logo animation'],
    ['Double tap', 'Double tap on the button for size and color animation'],
  ], animationOptions = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  Tween<Offset> offset = Tween(begin: const Offset(1,1), end: const Offset(0,0));

  bool colorAnim = false;

  @override
  void initState(){
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this
    );

    curve = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
    doColorAnimations();
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
    ).animate(curve);

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future future = Future(() {});
      for (var element in animationOptionsList) {
        future = future.then((value) {
          return Future.delayed(const Duration(milliseconds: 200), (){
            customPrint.myCustomPrint(element);
            animationOptions.add(element);
            listKey.currentState?.insertItem(animationOptions.length-1);
          });
        });
      }
    });
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> doColorAnimations() async {
    Color text1 = await BlocProvider.of<AppThemeCubit>(context).getColor(context, 'text1');
    Color succ = await BlocProvider.of<AppThemeCubit>(context).getColor(context, 'success');
    colorAnimation = ColorTween(begin: text1, end: succ).animate(curve);
  }

  @override
  Future<void> didChangePlatformBrightness() async {
    customPrint.myCustomPrint('Platform changed in animations');
    doColorAnimations();
    super.didChangePlatformBrightness();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppThemeCubit, AppThemeState>(
      listener: (context, appThemeState) {
        doColorAnimations();
      },
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
                  ]
              ),
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
                  return AnimatedList(
                      key: listKey,
                      initialItemCount: animationOptions.length,
                      itemBuilder: (context, index, animation){
                        return SlideTransition(
                          position: animation.drive(offset),
                          child: TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: 1),
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.decelerate,
                            builder: (BuildContext context, double value, Widget? child) {
                              return ListTile(
                                title:
                                AppTexts(
                                  textString: animationOptions[index][0],
                                  textFontSize: sizeAnimation.value,
                                  fontWeight: FontWeight.bold,
                                  textColor: colorAnimation.value,
                                ),
                                subtitle: AppTexts(
                                  textString: animationOptions[index][1],
                                  textFontSize: 10.0.sp,
                                  fontWeight: FontWeight.bold,
                                  textColor: (appThemeState).themeClass.textColor_1,
                                ),
                              );
                            },
                          ),
                        );
                      }
                  );
                },
              ),
            )
        );
      },
    );
  }
}
