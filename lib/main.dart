import 'package:auto/assets/themes/dark.dart';
import 'package:auto/assets/themes/light.dart';
import 'package:auto/features/login/presentation/pages/login_screen.dart';
import 'package:auto/features/login/presentation/pages/register_screen.dart';
import 'package:auto/features/login/presentation/pages/sefety_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: LightTheme.theme(),
        darkTheme: DarkTheme.theme(),
        themeMode: ThemeMode.light,
        home: const SafetyScreen()
      );
}
