import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData
{
  static  ThemeData lightTheme = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsApp.white,
        selectedItemColor: ColorsApp.grey,
        unselectedItemColor: ColorsApp.grey500,
      ),
      scaffoldBackgroundColor: ColorsApp.white,
      appBarTheme: AppBarTheme(
        color: ColorsApp.white,
      )
  );
  static  ThemeData darkTheme = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsApp.black,
        selectedItemColor: ColorsApp.blue,
        unselectedItemColor: ColorsApp.grey500,
      ),
      scaffoldBackgroundColor: ColorsApp.black,
      appBarTheme: AppBarTheme(
        color: ColorsApp.black,
      ),

  );
}