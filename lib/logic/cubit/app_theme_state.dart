part of 'app_theme_cubit.dart';

abstract class AppThemeState extends Equatable {
  final Brightness brightness;
  final String themeSetting;
  const AppThemeState({required this.brightness, required this.themeSetting});
}

class AppThemeInitial extends AppThemeState {
  const AppThemeInitial({required super.brightness, required super.themeSetting});

  @override
  List<Object> get props => [brightness, themeSetting];
}

class AppThemeSet extends AppThemeState {
  AppTheme themeClass;
  AppThemeSet({required super.brightness, required this.themeClass, required super.themeSetting});

  @override
  List<Object> get props => [brightness, themeClass, themeSetting];
}
