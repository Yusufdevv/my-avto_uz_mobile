import 'package:auto/assets/themes/dark.dart';
import 'package:auto/assets/themes/light.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/dealers/presentation/dealers_main.dart';
 import 'package:auto/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';


void main() {
  setupLocator();
  runApp(const AppProvider());
}



class AppProvider extends StatelessWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const App();
}


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto.Uz',
      theme: LightTheme.theme(),
      darkTheme: DarkTheme.theme(),
      themeMode: ThemeMode.light,
      navigatorKey: _navigatorKey, onGenerateRoute: (settings) => SplashScreen.route(),
      home: DealerScreen(),
      // onGenerateRoute: (settings) => SplashScreen.route(),
    );
}


