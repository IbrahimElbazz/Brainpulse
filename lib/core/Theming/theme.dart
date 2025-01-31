import 'package:flutter/material.dart';

import 'colors.dart';

class Theming
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
}