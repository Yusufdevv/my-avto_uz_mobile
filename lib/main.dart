import 'package:auto/assets/themes/dark.dart';
import 'package:auto/assets/themes/light.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/dealers/presentation/dealers_main.dart';
import 'package:auto/features/login/presentation/login_screen.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:auto/features/splash/presentation/pages/splash_sc.dart';
import 'package:auto/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

  NavigatorState get navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (c) => AuthenticationBloc(AuthRepository())..add(CheckUser()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Auto.Uz',
          theme: LightTheme.theme(),
          darkTheme: DarkTheme.theme(),
          themeMode: ThemeMode.light,
          navigatorKey: _navigatorKey,
          onGenerateRoute: (settings) => SplashScreen.route(),
          builder: (context, child) =>
              BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.unauthenticated:
                  navigator.pushAndRemoveUntil(
                      fade(page: const LoginScreen()), (route) => false);
                  break;
                case AuthenticationStatus.authenticated:
                  navigator.pushAndRemoveUntil(
                      fade(page: const HomeScreen()), (route) => false);
                  break;
              }
            },
            child: child,
          ),
        ),
      );
}
