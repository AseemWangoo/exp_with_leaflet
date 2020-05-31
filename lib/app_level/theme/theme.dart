import 'package:exp_with_leaflet/app_level/styles/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get appTheme => _Internal._appTheme();
}

class _Internal {
  static ThemeData _appTheme() => ThemeData(
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.primaryColor,
        ),
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.primaryColor,

        // Text theme....
        textTheme: TextTheme(
          headline1: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 96.0,
            letterSpacing: -1.5,
          ),
          headline2: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 60.0,
            letterSpacing: -0.5,
          ),
          headline3: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 48.0,
            letterSpacing: 0.0,
          ),
          headline4: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 34.0,
            letterSpacing: 0.25,
          ),
          headline5: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 24.0,
            letterSpacing: 0.0,
          ),
          headline6: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 20.0,
            letterSpacing: 0.15,
          ),
          bodyText2: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
            letterSpacing: 0.5,
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            letterSpacing: 1.25,
          ),
        ),

        // Card theme....
        cardTheme: CardTheme(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),

        // Dialog theme....
        dialogTheme: DialogTheme(
          elevation: 8.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
