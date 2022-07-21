import 'package:auto/assets/themes/dark.dart';
import 'package:auto/assets/themes/light.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
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
        themeMode: ThemeMode.dark,
        home: Builder(
          builder: (context) => Scaffold(
                body:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WTextField(
                      onChanged: (value) {},
                      height: 44,
                      width: 100,
                      controller: TextEditingController(),
                      hintText: "ello",
                    ),
                  ],
                )
            )
        )
      );
}
