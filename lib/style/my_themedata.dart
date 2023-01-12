import 'package:flutter/material.dart';
import 'package:route_movies_app/style/my_colors.dart';

class MyThemeData {
  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimaryColor,
    scaffoldBackgroundColor: darkBackGroundColor,
    appBarTheme: AppBarTheme(
      color: darkPrimaryColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white),
      //for appbar title//20
      subtitle2: TextStyle(color: Colors.white),
      //14 meduim bold for sections title
      bodyText2: TextStyle(color: Colors.white),
      //14 regular
      caption: TextStyle(color: Color(0xffB5B4B4)), //12
    ),
    colorScheme: ColorScheme(
      primary: darkPrimaryColor,
      onPrimary: Colors.white,
      secondary: darkSelectedColor,
      onSecondary: darkUnselectedColor,
      error: Colors.red,
      onError: Colors.white,
      surface: darkPrimaryColor,
      onSurface: Colors.black45,
      background: darkBackGroundColor,
      onBackground: Colors.white,
      brightness: Brightness.light,
    ),
  );
}
