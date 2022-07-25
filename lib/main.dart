import 'package:auto/assets/themes/dark.dart';
import 'package:auto/assets/themes/light.dart';
import 'package:auto/features/onboarding/presentation/first_onboarding.dart';
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
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home:  const FirstOnBoarding()
      );
}
