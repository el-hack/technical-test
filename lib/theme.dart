// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constant/color_constant.dart';
import 'constant/string_constant.dart';

class AppTheme {
  static final lightTheme = ThemeData.light(useMaterial3: false).copyWith(
    // brightness: Brightness.light,
    listTileTheme: ListTileThemeData(
        textColor: Colors.black,
        style: ListTileStyle.drawer,
        iconColor: Colors.black),
    appBarTheme: AppBarTheme(
      titleSpacing: 0,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontFamily: ConstantString.font,
        color: Colors.black,
      ),
    ),

    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: ConstantColor.primary,
      secondary: ConstantColor.primary,
      onPrimary: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true, // this will remove the default content padding
      // now you can customize it here or add padding widget
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ConstantColor.primary,
      foregroundColor: Colors.white,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(ConstantColor.primary),
    ),
    tabBarTheme: TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: ConstantColor.primary,
          width: 2,
        ),
      ),
      labelColor: ConstantColor.primary,
      unselectedLabelColor: Colors.black,
      labelStyle: TextStyle(
        color: ConstantColor.primary,
        fontFamily: ConstantString.font,
        fontWeight: FontWeight.w700,
        fontSize: 15,
      ),
      unselectedLabelStyle: TextStyle(
        color: ConstantColor.primary,
        fontFamily: ConstantString.font,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
    ),
    dialogTheme: DialogTheme(
      contentTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: ConstantString.font,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: ConstantString.font,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    cardTheme: CardTheme(color: Colors.white),
    shadowColor: Colors.grey.withOpacity(0.1),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontFamily: ConstantString.font,
          fontWeight: FontWeight.w500,
          color: ConstantColor.primary,
          fontSize: 16,
        ),
      ),
    )),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: ConstantString.font,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontFamily: ConstantString.font,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontFamily: ConstantString.font,
        // fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontFamily: ConstantString.font,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontFamily: ConstantString.font,
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: ConstantString.font,
        fontSize: 15,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: ConstantString.font,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontSize: 12,
      ),
      bodySmall: TextStyle(
        fontFamily: ConstantString.font,
        fontSize: 10,
        color: Colors.black,
      ),
    ),
  );
}
