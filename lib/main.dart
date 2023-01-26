import 'dart:async';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/dark.dart';
import 'package:auto/assets/themes/light.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/ad/domain/usecases/get_top_makes.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/bloc/comparison_add/bloc/comparison_add_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/bloc/internet_bloc/internet_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/repository/add_wishlist_repository.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/common/usecases/add_wishlist_usecase.dart';
import 'package:auto/features/common/usecases/announcement_list_usecase.dart';
import 'package:auto/features/common/usecases/get_regions.dart';
import 'package:auto/features/comparison/data/repositories/comparison_cars_repo_impl.dart';
import 'package:auto/features/comparison/domain/usecases/comparison_add_use_case.dart';
import 'package:auto/features/comparison/domain/usecases/delete_comparison.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        fallbackLocale: const Locale('uz'),
        assetLoader: const CodegenLoader(),
        child: const AppProvider()),
  );
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
    bloc = InternetBloc();
    super.initState();
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
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get navigator => _navigatorKey.currentState!;
  StreamSubscription? streamSubscription;
  InternetBloc bloc = InternetBloc();

  @override
  void initState() {
    bloc = InternetBloc();
    streamSubscription =
        Connectivity().onConnectivityChanged.listen((status) {
      context.read<InternetBloc>().add(GlobalCheck(
          isConnected: status == ConnectivityResult.mobile || status == ConnectivityResult.wifi));
          print('====net=status ${status == ConnectivityResult.mobile || status == ConnectivityResult.wifi}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          // BlocProvider(create: (c) => InternetBloc()),
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
            create: (context) => ProfileBloc(),
          ),
          BlocProvider(
            create: (context) => GetMakesBloc(
              topUseCase: GetTopMakesUseCase(
                  repository: serviceLocator<AdRepositoryImpl>()),
              useCase: GetMakesUseCase(
                repository: serviceLocator<AdRepositoryImpl>(),
              ),
            ),
          ),
          BlocProvider(
              create: (context) => GetCarModelBloc(
                  useCase: GetCarModelUseCase(
                      repository: serviceLocator<AdRepositoryImpl>()))),
          BlocProvider(
              create: (context) => WishlistAddBloc(
                  useCase: AddWishlistUseCase(
                      repo: serviceLocator<AddWishlistRepositoryImpl>()),
                  removeWishlistUseCase: RemoveWishlistUseCase(
                      repo: serviceLocator<AddWishlistRepositoryImpl>()))),
          BlocProvider(
              create: (context) => ComparisonAddBloc(
                  addUseCase: ComparisonAddUseCase(
                      comparisonAddRepo:
                          serviceLocator<ComparisonCarsRepoImpl>()),
                  deleteUseCase: DeleteComparisonUseCase(
                      comparisonCarsRepo:
                          serviceLocator<ComparisonCarsRepoImpl>()))),
          BlocProvider(
              create: (context) => AnnouncementListBloc(
                  useCase: AnnouncementListUseCase(
                      repositoryImpl: serviceLocator<AdRepositoryImpl>())))
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
            title: 'Auto.Uz',
            theme: LightTheme.theme(),
            darkTheme: DarkTheme.theme(),
            themeMode: ThemeMode.light,
            navigatorKey: _navigatorKey,
            onGenerateRoute: (settings) => SplashSc.route(),
            builder: (context, child) {
              SizeConfig().init(context);

              return BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  switch (state.status) {
                    case AuthenticationStatus.unauthenticated:
                      if (StorageRepository.getString('token', defValue: '')
                          .isNotEmpty) {
                        navigator.pushAndRemoveUntil(
                            fade(page: const HomeScreen()), (route) => false);
                            
                        break;
                      }
                      if (!StorageRepository.getBool('onboarding',
                          defValue: false)) {
                        navigator.pushAndRemoveUntil(
                            fade(page: const FirstOnBoarding()),
                            (route) => false);
                        break;
                      }
                      navigator.pushAndRemoveUntil(
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
                        navigator.pushAndRemoveUntil(
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
                        navigator.pushAndRemoveUntil(
                            fade(page: const HomeScreen()), (route) => false);
                      }
                      break;
                    case AuthenticationStatus.loading:
                    case AuthenticationStatus.cancelLoading:
                      break;
                  }
                },
                child: child,
              );
            },
          ),
        ),
      );
}
