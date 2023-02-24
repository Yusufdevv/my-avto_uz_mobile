import 'dart:async';
import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/app_constants.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/assets/themes/dark.dart';
import 'package:auto/assets/themes/light.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/common/bloc/deeplinking/deep_link_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/bloc/internet_bloc/internet_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/login/domain/usecases/register_user.dart';
import 'package:auto/features/login/domain/usecases/send_code.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/login/presentation/bloc/register/register_bloc.dart';
import 'package:auto/features/login/presentation/login_screen.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/onboarding/presentation/first_onboarding.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/splash/presentation/pages/splash_sc.dart';
import 'package:auto/generated/codegen_loader.g.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // The following lines are the same as previously explained in "Handling uncaught errors"
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    await EasyLocalization.ensureInitialized();
    setupLocator();
    await StorageRepository.getInstance();
    debugRepaintRainbowEnabled = false;
    runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('uz'),
          Locale('ru'),
        ],
        path: 'lib/assets/strings',
        fallbackLocale: const Locale('uz'),
        startLocale: const Locale('uz'),
        assetLoader: const CodegenLoader(),
        child: const AppProvider(),
      ),
    );
  }, (error, stack) => {

  });
}

class AppProvider extends StatefulWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  State<AppProvider> createState() => _AppProviderState();
}

class _AppProviderState extends State<AppProvider> {
  late InternetBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = InternetBloc();
  }

  @override
  Widget build(BuildContext context) =>
      BlocProvider.value(value: bloc, child: const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // ignore: cancel_subscriptions
  StreamSubscription? streamSubscription;
  InternetBloc bloc = InternetBloc();

  @override
  void initState() {
    bloc = InternetBloc();
    streamSubscription = Connectivity().onConnectivityChanged.listen((status) {
      bloc.add(GlobalCheck(
          isConnected: status == ConnectivityResult.mobile ||
              status == ConnectivityResult.wifi));
      log('app log: status ${status == ConnectivityResult.mobile || status == ConnectivityResult.wifi}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (c) => bloc),
          BlocProvider(create: (c) => AuthenticationBloc()..add(CheckUser())),
          BlocProvider(
              create: (context) =>
                  RegionsBloc()..add(RegionsEvent.getRegions())),
          BlocProvider(create: (context) => ShowPopUpBloc()),
          BlocProvider(create: (context) => ProfileBloc()),
          BlocProvider(create: (context) => DeepLinkBloc()),
          BlocProvider(create: (context) => GetMakesBloc()),
          BlocProvider(create: (context) => GetCarModelBloc()),
          BlocProvider(create: (context) => WishlistAddBloc()),
          BlocProvider(create: (context) => ComparisonAddBloc()),
        ],
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: white,
            systemNavigationBarColor: white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: MaterialApp(
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Avto.uz',
            theme: LightTheme.theme(),
            darkTheme: DarkTheme.theme(),
            themeMode: ThemeMode.light,
            navigatorKey: AppConstants.navigatorKey,
            onGenerateRoute: (settings) => SplashSc.route(),
            builder: (context, child) {
              SizeConfig().init(context);

              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: BlocListener<DeepLinkBloc, DeepLinkState>(
                  listener: (context, state) {},
                  child: BlocListener<AuthenticationBloc, AuthenticationState>(
                    listener: (context, state) {
                      switch (state.status) {
                        case AuthenticationStatus.unauthenticated:
                          if (StorageRepository.getString(StorageKeys.TOKEN,
                                  defValue: '')
                              .isNotEmpty) {
                            AppConstants.navigatorKey.currentState
                                ?.pushAndRemoveUntil(
                                    fade(page: const HomeScreen()),
                                    (route) => false);
                            break;
                          }
                          if (!StorageRepository.getBool(
                              StorageKeys.ON_BOARDING,
                              defValue: false)) {
                            AppConstants.navigatorKey.currentState
                                ?.pushAndRemoveUntil(
                                    fade(page: const FirstOnBoarding()),
                                    (route) => false);
                            break;
                          }
                          AppConstants.navigatorKey.currentState
                              ?.pushAndRemoveUntil(
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
                          context.read<ShowPopUpBloc>().add(HidePopUp());
                          if (StorageRepository.getString(StorageKeys.TOKEN)
                              .isEmpty) {
                            AppConstants.navigatorKey.currentState
                                ?.pushAndRemoveUntil(
                                    fade(
                                      page: BlocProvider(
                                        create: (c) => RegisterBloc(
                                          sendCodeUseCase: SendCodeUseCase(),
                                          registerUseCase: RegisterUseCase(),
                                          verifyCodeUseCase:
                                              VerifyCodeUseCase(),
                                        ),
                                        child: const LoginScreen(),
                                      ),
                                    ),
                                    (route) => false);
                          } else {
                            AppConstants.navigatorKey.currentState
                                ?.pushAndRemoveUntil(
                                    fade(page: const HomeScreen()),
                                    (route) => false);
                          }
                          break;
                        case AuthenticationStatus.loading:
                        case AuthenticationStatus.cancelLoading:
                          break;
                      }
                    },
                    child: child,
                  ),
                ),
              );
            },
          ),
        ),
      );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;
}
