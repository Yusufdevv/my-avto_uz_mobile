import 'package:auto/assets/themes/dark.dart';
import 'package:auto/assets/themes/light.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/common/usecases/get_regions.dart';
import 'package:auto/features/login/domain/usecases/register_user.dart';
import 'package:auto/features/login/domain/usecases/send_code.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/login/presentation/login_screen.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/onboarding/presentation/first_onboarding.dart';
import 'package:auto/features/splash/presentation/pages/splash_sc.dart';
import 'package:auto/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupLocator();
  await StorageRepository.getInstance();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('ru'),
          Locale('uz'),
        ],
        path: 'lib/assets/strings',
        fallbackLocale: const Locale('ru'),
        assetLoader: const CodegenLoader(),
        child: const AppProvider()),
  );
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
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (c) =>
                AuthenticationBloc(AuthRepository())..add(CheckUser()),
          ),
          BlocProvider(
            create: (context) => RegionsBloc(GetRegionsUseCase())
              ..add(RegionsEvent.getRegions()),
          ),
          BlocProvider(
            create: (context) => ShowPopUpBloc(),
          ),
          BlocProvider(
            create: (context) => GetMakesBloc(
              selectedMakeId: -1,
              useCase: GetMakesUseCase(
                repository: serviceLocator<AdRepositoryImpl>(),
              ),
            )..add(GetMakesBlocEvent.getMakes()),
          ),
          BlocProvider(
              create: (context) => GetCarModelBloc(
                  useCase: GetCarModelUseCase(
                      repository: serviceLocator<AdRepositoryImpl>())))
        ],
        child: MaterialApp(
          
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Auto.Uz',
          theme: LightTheme.theme(),
          darkTheme: DarkTheme.theme(),
          themeMode: ThemeMode.light,
          navigatorKey: _navigatorKey,
          onGenerateRoute: (settings) => SplashSc.route(),
          builder: (context, child) {
            SizeConfig().init(context);
            return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) async {
                await Future.delayed(const Duration(seconds: 3));
                switch (state.status) {
                  case AuthenticationStatus.unauthenticated:
                    if (!StorageRepository.getBool('onboarding',
                        defValue: false)) {
                      await navigator.pushAndRemoveUntil(
                          fade(page: const FirstOnBoarding()),
                          (route) => false);
                      break;
                    }
                    await navigator.pushAndRemoveUntil(
                        fade(
                          page: BlocProvider(
                            create: (c) => RegisterBloc(
                              sendCodeUseCase: SendCodeUseCase(),
                              registerUseCase: RegisterUseCase(),
                              verifyCodeUseCase: VerifyCodeUseCase(),
                            ),
                            child: const LoginScreen(),
                          ),
                        ),
                        (route) => false);

                    break;
                  case AuthenticationStatus.authenticated:
                    if (StorageRepository.getString('token').isEmpty) {
                      await navigator.pushAndRemoveUntil(
                          fade(
                            page: BlocProvider(
                              create: (c) => RegisterBloc(
                                sendCodeUseCase: SendCodeUseCase(),
                                registerUseCase: RegisterUseCase(),
                                verifyCodeUseCase: VerifyCodeUseCase(),
                              ),
                              child: const LoginScreen(),
                            ),
                          ),
                          (route) => false);
                    } else {
                      await navigator.pushAndRemoveUntil(
                          fade(page: const HomeScreen()), (route) => false);
                    }
                    break;
                }
              },
              child: child,
            );
          },
        ),
      );
}
