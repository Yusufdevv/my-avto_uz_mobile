import 'dart:async';
import 'dart:developer';

// org.uicgroup.uz
import 'package:auto/assets/constants/app_constants.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/assets/themes/dark.dart';
import 'package:auto/assets/themes/light.dart';
import 'package:auto/assets/themes/theme_extensions/themed_brightness.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc.dart';
import 'package:auto/features/common/bloc/internet_bloc/internet_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/bloc/theme_switcher_bloc/theme_switcher_bloc.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/deep_linking/deep_link_bloc.dart';
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
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
  }, (error, stack) => {});
}

class AppProvider extends StatefulWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  State<AppProvider> createState() => _AppProviderState();
}

class _AppProviderState extends State<AppProvider> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => const App();
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // ignore: cancel_subscriptions
  StreamSubscription? streamSubscription;
  late InternetBloc bloc;
  late AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    bloc = InternetBloc();
    authenticationBloc = AuthenticationBloc()..add(CheckUser());

    streamSubscription = Connectivity().onConnectivityChanged.listen((status) {
      bloc.add(GlobalCheck(
          isConnected: status == ConnectivityResult.mobile ||
              status == ConnectivityResult.wifi));
      log('app log: status ${status == ConnectivityResult.mobile || status == ConnectivityResult.wifi}');
    });
    super.initState();
  }

//900470792
  //pppppp
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (c) => bloc),
          BlocProvider(create: (c) => authenticationBloc),
          BlocProvider(
              create: (context) =>
                  RegionsBloc()..add(RegionsEvent.getRegions())),
          BlocProvider(create: (context) => ShowPopUpBloc()),
          BlocProvider(create: (context) => ProfileBloc()),
          BlocProvider(create: (context) => GetMakesBloc()),
          BlocProvider(create: (context) => WishlistAddBloc()),
          BlocProvider(create: (context) => ComparisonAddBloc()),
          BlocProvider(create: (context) => ThemeSwitcherBloc()),
          BlocProvider(create: (context) => DeepLinkBloc()),
        ],
        child: BlocBuilder<ThemeSwitcherBloc, ThemeSwitcherState>(
          builder: (context, themeState) => MaterialApp(
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Avto.uz',
            theme: LightTheme.theme(),
            darkTheme: DarkTheme.theme(),
            themeMode: themeState.themeMode,
            navigatorKey: AppConstants.navigatorKey,
            onGenerateRoute: (settings) => SplashSc.route(),
            builder: (context, child) {
              SizeConfig().init(context);
              return AnnotatedRegion(
                value: SystemUiOverlayStyle(
                  statusBarColor:
                      Theme.of(context).extension<ThemedColors>()!.whiteToDark,
                  systemNavigationBarColor:
                      Theme.of(context).extension<ThemedColors>()!.whiteToDark,
                  // statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Theme.of(context)
                      .extension<ThemedBrightness>()!
                      .brightness,
                  systemNavigationBarIconBrightness: Theme.of(context)
                      .extension<ThemedBrightness>()!
                      .brightness,
                ),
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: BlocListener<AuthenticationBloc, AuthenticationState>(
                    listenWhen: (previous, current) => true,
                    listener: (context, state) {
                      switch (state.status) {
                        case AuthenticationStatus.unauthenticated:
                          if (!StorageRepository.getBool(
                              StorageKeys.ON_BOARDING,
                              defValue: false)) {
                            AppConstants.navigatorKey.currentState
                                ?.pushAndRemoveUntil(
                                    fade(page: const FirstOnBoarding()),
                                    (route) => false);
                            break;
                          }
                          AppConstants.navigatorKey.currentState?.push(
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
                          );
                          break;
                        case AuthenticationStatus.authenticated:
                          context.read<ShowPopUpBloc>().add(HidePopUp());
                          if (StorageRepository.getString(StorageKeys.TOKEN)
                              .isEmpty) {
                            AppConstants.navigatorKey.currentState?.push(
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
                            );
                          } else {
                            AppConstants.navigatorKey.currentState
                                ?.pushAndRemoveUntil(
                                    fade(page: const HomeScreen()),
                                    (route) => false);
                          }
                          break;
                        case AuthenticationStatus.loading:
                          AppConstants.navigatorKey.currentState
                              ?.pushAndRemoveUntil(
                                  fade(page: const HomeScreen()),
                                  (route) => false);
                          break;
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
