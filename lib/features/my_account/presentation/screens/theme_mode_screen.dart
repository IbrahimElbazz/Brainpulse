import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Widgets/custom_circle_button_pop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/theme-provider.dart';
import '../../../../generated/app_localizations.dart';

class ThemeModeScreen extends StatelessWidget {
  const ThemeModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              children: [
                SizedBox(width: 15.w),
                const CustomCircleButtonPop(),
                SizedBox(width: 70.w),
                Text(
                  AppLocalizations.of(context)!.theme_mode,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(AppLocalizations.of(context)!.dark_mode),
                      trailing: Radio<bool>(
                        value: true,
                        groupValue: themeProvider.isDarkMode,
                        onChanged: (value) {
                          if (value == true) {
                            themeProvider.setDarkTheme();
                          }
                        },
                        activeColor: ColorsApp.primary,
                      ),
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context)!.light_mode),
                      trailing: Radio<bool>(
                        value: false,
                        groupValue: themeProvider.isDarkMode,
                        onChanged: (value) {
                          if (value == false) {
                            themeProvider.setLightTheme();
                          }
                        },
                        activeColor: ColorsApp.primary,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
