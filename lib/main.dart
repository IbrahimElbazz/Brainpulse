import 'package:brain_pulse/brain_pulse.dart';
import 'package:brain_pulse/core/di/dependency_injection.dart';
import 'package:brain_pulse/core/helpers/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'core/provider/language.provider.dart';
import 'core/provider/theme-provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
late bool isLoggedIn;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  Bloc.observer = MyBlocObserver();

  sharedPreferences = await SharedPreferences.getInstance();
  isLoggedIn = sharedPreferences.getString('token') != null;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: const BrainPulse(),
    ),
  );
}


// email : 0
// pass : 00000000