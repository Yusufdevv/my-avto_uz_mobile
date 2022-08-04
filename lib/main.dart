import 'package:auto/assets/themes/dark.dart';
import 'package:auto/assets/themes/light.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// class MyColors extends ThemeExtension<MyColors>

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: LightTheme.theme(),
      darkTheme: DarkTheme.theme(),
      themeMode: ThemeMode.dark,
      home: const DealersMain());
}
