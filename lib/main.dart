import 'package:auto/assets/themes/dark.dart';
import 'package:auto/assets/themes/light.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  // NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Auto.Uz',
        theme: LightTheme.theme(),
        darkTheme: DarkTheme.theme(),
        themeMode: ThemeMode.dark,
        navigatorKey: _navigatorKey,
        home: const HomeScreen(),
        // onGenerateRoute: (settings) => SplashScreen.route(),
      );
}
