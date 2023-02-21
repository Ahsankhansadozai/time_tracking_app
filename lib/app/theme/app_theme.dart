import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: AppColor.Orange,
        primaryColorLight: AppColor.Orange,
        primaryColorDark: AppColor.Orange,
        fontFamily: 'Montserrat',
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColor.BackgroundLight),
        )),
        appBarTheme: AppBarTheme(
            elevation: 0.2,
            iconTheme: IconThemeData(color: AppColor.Black),
            backgroundColor: AppColor.Orange,
            titleTextStyle: TextStyle(
                color: AppColor.Black,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800),
            systemOverlayStyle: SystemUiOverlayStyle.dark
                .copyWith(statusBarColor: AppColor.White)),
        scaffoldBackgroundColor: AppColor.CardLight,
        cardTheme: CardTheme(
          color: AppColor.Gray200,
        ),
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: AppColor.BackgroundLight),
        inputDecorationTheme: InputDecorationTheme(fillColor: AppColor.White),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.White,
          elevation: 10,
          selectedItemColor: AppColor.selectedBottomItemColor,
          unselectedItemColor: AppColor.unselectedBottomItemColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
          ),
          unselectedLabelStyle: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat'),
        ),
        dividerColor: AppColor.DividerLight,
        splashColor: AppColor.White,
        iconTheme: IconThemeData(color: AppColor.Black),
        textTheme: ThemeData.light().textTheme,
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: AppColor.Orange),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: AppColor.Red,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: AppColor.BlueDark,
        primaryColorLight: AppColor.BlueDark,
        primaryColorDark: AppColor.BlueDark,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColor.BackgroundDark),
        )),
        appBarTheme: AppBarTheme(
            elevation: 0.2,
            iconTheme: IconThemeData(color: AppColor.White),
            backgroundColor: AppColor.Blue,
            titleTextStyle: TextStyle(
                color: AppColor.White,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800),
            systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: AppColor.Blue,
                statusBarColor: AppColor.Blue,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.light)),
        scaffoldBackgroundColor: AppColor.BackgroundDark,
        cardColor: AppColor.CardDark,
        inputDecorationTheme: InputDecorationTheme(
            fillColor: AppColor.BlueDark,
            iconColor: AppColor.White,
            hintStyle: TextStyle(color: AppColor.Gray500)),
        dialogTheme: DialogTheme(backgroundColor: AppColor.BackgroundDark),
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: AppColor.BackgroundDark),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.Blue,
          elevation: 8,
          selectedItemColor: AppColor.selectedBottomItemColor,
          unselectedItemColor: AppColor.unselectedBottomItemColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle:
              TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        dividerColor: AppColor.DividerDark,
        splashColor: AppColor.Transparent,
        iconTheme: IconThemeData(color: AppColor.White),
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: AppColor.Red700),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: AppColor.Red,
        ));
  }
}
