import 'package:clean_base/src/config/themes/app_colors.dart';
import 'package:clean_base/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextStyle? textStyleBodyText1(context) => Theme.of(context).textTheme.bodyText1;

TextStyle? textStyleBodyText2(context) => Theme.of(context).textTheme.bodyText2;

class AppTheme {
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      textTheme: _textTheme,
      colorScheme: _colorScheme,
      hintColor: AppColors.blackColor,
      fontFamily: defaultTextStyle.fontFamily,
      primaryColor: AppColors.primary_500,
      scaffoldBackgroundColor: AppColors.whiteColor,
    );
  }

  get defaultTextStyle => const TextStyle(
        fontFamily: Constants.fontFamily,
        color: AppColors.blackColor,
        letterSpacing: 0,
      );

  get _textTheme => TextTheme(
        bodyText1: defaultTextStyle.copyWith(
          fontSize: 14.0,
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: defaultTextStyle.copyWith(
          fontSize: 14.0,
          color: AppColors.whiteColor,
        ),
        caption: defaultTextStyle.copyWith(
          color: AppColors.blackColor,
          fontSize: 12.0,
        ),
        headline1: defaultTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 26.0,
          color: AppColors.blackColor,
        ),
        headline2: defaultTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: AppColors.blackColor,
        ),
        headline3: defaultTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
          color: AppColors.blackColor,
        ),
        headline4: defaultTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: AppColors.blackColor,
        ),
        headline5: defaultTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: AppColors.blackColor,
        ),
        headline6: defaultTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          color: AppColors.blackColor,
        ),
      );

  get _colorScheme => const ColorScheme.light(
        primary: AppColors.primary_500,
        secondary: AppColors.whiteColor,
        onSecondary: AppColors.whiteColor,
      );
}
