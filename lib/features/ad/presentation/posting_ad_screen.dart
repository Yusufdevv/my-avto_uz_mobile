import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/usecases/contacts_usecase.dart';
import 'package:auto/features/ad/domain/usecases/create_announcement.dart';
import 'package:auto/features/ad/domain/usecases/get_body_type.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ad/domain/usecases/get_drive_type.dart';
import 'package:auto/features/ad/domain/usecases/get_engine_type.dart';
import 'package:auto/features/ad/domain/usecases/get_generation.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/ad/domain/usecases/get_map_screenshot_usecase.dart';
import 'package:auto/features/ad/domain/usecases/get_years.dart';
import 'package:auto/features/ad/domain/usecases/minimum_price_usecase.dart';
import 'package:auto/features/ad/presentation/bloc/bloc/choose_make_anime_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/add_photo_screen.dart';
import 'package:auto/features/ad/presentation/pages/carcase/carcase_screen.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/choose_brand_screen.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/choose_car_model.dart';
import 'package:auto/features/ad/presentation/pages/color/colors_screen.dart';
import 'package:auto/features/ad/presentation/pages/contact/contact_screen.dart';
import 'package:auto/features/ad/presentation/pages/damage/damage_screen.dart';
import 'package:auto/features/ad/presentation/pages/description/description_screen.dart';
import 'package:auto/features/ad/presentation/pages/drive_type/drive_type_screen.dart';
import 'package:auto/features/ad/presentation/pages/engine/engine_screen.dart';
import 'package:auto/features/ad/presentation/pages/equipment/equipment_screen.dart';
import 'package:auto/features/ad/presentation/pages/gear_box/gearbox_screen.dart';
import 'package:auto/features/ad/presentation/pages/generation/generation_screen.dart';
import 'package:auto/features/ad/presentation/pages/inspection_place/inspection_place_screen.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/map_screen_posting_ad.dart';
import 'package:auto/features/ad/presentation/pages/mileage/mileage_screen.dart';
import 'package:auto/features/ad/presentation/pages/modification/modification_screen.dart';
import 'package:auto/features/ad/presentation/pages/preview/preview_screen.dart';
import 'package:auto/features/ad/presentation/pages/price/price_screen.dart';
import 'package:auto/features/ad/presentation/pages/pts/pts_screen.dart';
import 'package:auto/features/ad/presentation/pages/year_of_issue/year_issue_screen.dart';
import 'package:auto/features/ad/presentation/widgets/posting_ad_appbar.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/common/usecases/get_districts_usecase.dart';
import 'package:auto/features/common/usecases/get_regions_usecase.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/my_adds/my_ads_page.dart';
import 'package:auto/features/profile/presentation/profile_screen.dart';
import 'package:auto/features/rent/domain/usecases/get_gearboxess_usecase.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class PostingAdScreen extends StatefulWidget {
  final int? announcementId;
  const PostingAdScreen({this.announcementId, Key? key}) : super(key: key);

  @override
  State<PostingAdScreen> createState() => _PostingAdScreenState();
}

class _PostingAdScreenState extends State<PostingAdScreen>
    with SingleTickerProviderStateMixin {
  late PageController pageController;
  late PostingAdBloc postingAdBloc;
  late ChooseMakeAnimeBloc animeBloc;
  late GlobalKey globalKey;
  late int currentTabIndex;
  late AnimationController animeController;
  static int initialPage = 0;
  final int tabLength = 20;
  @override
  void initState() {
    animeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    animeBloc = ChooseMakeAnimeBloc(
      scaleAnimation: Tween<double>(
        begin: 1,
        end: 0,
      ).animate(
        CurvedAnimation(
          curve: Curves.decelerate,
          parent: animeController,
        ),
      ),
      reversScaleAnimation: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          curve: Curves.decelerate,
          parent: animeController,
        ),
      ),
      animationController: animeController,
    );
    globalKey = GlobalKey();
    pageController = PageController(initialPage: initialPage);
    postingAdBloc = PostingAdBloc(
      screenShotUseCase: GetMapScreenShotUseCase(
          repository: serviceLocator<AdRepositoryImpl>()),
      getYearsUseCase:
          GetYearsUseCase(repository: serviceLocator<AdRepositoryImpl>()),
      userRepository: AuthRepository(),
      contactsUseCase:
          ContactsUseCase(repository: serviceLocator<AdRepositoryImpl>()),
      verifyCodeUseCase: VerifyCodeUseCase(),
      minimumPriceUseCase: GetMinimumPriceUseCase(
          repository: serviceLocator<AdRepositoryImpl>()),
      announcementUseCase: GetCarSingleUseCase(
          repository: serviceLocator<CarSingleRepositoryImpl>()),
      districtUseCase: GetDistrictsUseCase(),
      regionsUseCase: GetRegionsUseCase(),
      createUseCase: CreateAnnouncementUseCase(
          repository: serviceLocator<AdRepositoryImpl>()),
      bodyTypesUseCase:
          GetBodyTypeUseCase(repository: serviceLocator<AdRepositoryImpl>()),
      gearboxUseCase:
          GetGearBoxessUseCase(repository: serviceLocator<AdRepositoryImpl>()),
      driveTypeUseCase:
          GetDriveTypeUseCase(repository: serviceLocator<AdRepositoryImpl>()),
      engineUseCase:
          GetEngineTypeUseCase(repository: serviceLocator<AdRepositoryImpl>()),
      modelsUseCase:
          GetCarModelUseCase(repository: serviceLocator<AdRepositoryImpl>()),
      generationUseCase:
          GetGenerationUseCase(repository: serviceLocator<AdRepositoryImpl>()),
      topMakesUseCase: GetTopBrandUseCase(),
      makeUseCase:
          GetMakesUseCase(repository: serviceLocator<AdRepositoryImpl>()),
    );
    if (widget.announcementId == null) {
      currentTabIndex = initialPage;
      postingAdBloc.add(PostingAdMakesEvent());
    } else {
      currentTabIndex = 10;

      postingAdBloc
          .add(PostingAdGetAnnouncementEvent(id: widget.announcementId!));
    }

    super.initState();
  }

  List<String> tabs = [
    'Марку автомобиля',
    'Модель автомобиля',
    LocaleKeys.year_of_issue.tr(),
    'Поколение',
    LocaleKeys.body.tr(),
    'Двигатель',
    'Привод',
    LocaleKeys.drive_gearbox.tr(),
    'Модификация',
    'Цвет автомобиля',
    'Фотографии',
    'ПТС',
    'Описание',
    LocaleKeys.complectation.tr(),
    'Состояние кузова',
    'Контактные данные',
    'Место осмотра',
    'Цена',
    LocaleKeys.Mileage.tr(),
    'Предосмотор',
    'map'
  ];

  @override
  Widget build(BuildContext context) => CustomScreen(
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor:
                Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (c) => animeBloc),
              BlocProvider(create: (c) => postingAdBloc)
            ],
            child: BlocConsumer<PostingAdBloc, PostingAdState>(
              listener: (context, state) async {
                if (state.createStatus == FormzStatus.submissionSuccess) {
                  context.read<ShowPopUpBloc>().add(
                      ShowPopUp(message: state.toastMessage!, isSucces: true));
                  await Future.delayed(const Duration(milliseconds: 1000));
                  Navigator.pushReplacement(context, fade(page: MyAdsPage()));
                  return;
                }

                if (state.toastMessage != null &&
                    state.toastMessage!.isNotEmpty) {
                  context.read<ShowPopUpBloc>().add(
                      ShowPopUp(message: state.toastMessage!, isSucces: false));
                }
              },
              builder: (context, state) =>
                  BlocBuilder<ChooseMakeAnimeBloc, ChooseMakeAnimeState>(
                builder: (context, animeState) => Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(54),
                    child: PostingAdAppBar(
                      currentTabIndex: currentTabIndex,
                      reversScaleAnimation: animeState.reversScaleAnimation,
                      reverseTitle: LocaleKeys.choose_brand_auto.tr(),
                      scaleAnimation: animeState.scaleAnimation,
                      tabLength: tabLength,
                      hasShadow: state.hasAppBarShadow,
                      onTapBack: () {
                        if (currentTabIndex != 0) {
                          if (widget.announcementId != null) {
                            if (currentTabIndex > 10) {
                              --currentTabIndex;
                              postingAdBloc.add(PostingAdAddEventForEveryPage(
                                  page: currentTabIndex));
                              pageController.animateToPage(currentTabIndex,
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.linear);
                              setState(() {});
                            }
                          } else {
                            --currentTabIndex;
                            postingAdBloc.add(PostingAdAddEventForEveryPage(
                                page: currentTabIndex));
                            pageController.animateToPage(currentTabIndex,
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.linear);
                            setState(() {});
                          }
                        } else {
                          postingAdBloc.add(PostingAdGetMapScreenShotEvent(
                              lat: 51.727348, long: 22.557984, zoomLevel: 15));
                        }
                      },
                      onTapCancel: () {
                        print('=> => => =>     on tap cancel    <= <= <= <=');
                      },
                      title: currentTabIndex == 0
                          ? 'Назад'
                          : tabs[currentTabIndex - 1],
                    ),
                  ),
                  body: Stack(
                    children: [
                      PageView(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          //0
                          ChooseCarBrand(
                            tabLength: tabLength,
                            postingAddBloc: postingAdBloc,
                            onTopBrandPressed: (makeId) {
                              postingAdBloc
                                  .add(PostingAdChooseEvent(makeId: makeId));
                              currentTabIndex++;
                              postingAdBloc.add(PostingAdAddEventForEveryPage(
                                  page: currentTabIndex));
                              pageController.animateToPage(currentTabIndex,
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.linear);
                              setState(() {});
                            },
                          ),
                          //1
                          ChooseCarModelScreen(makeId: state.makeId ?? -1),
                          //2
                          const YearIssueScreenn(),
                          //3
                          const GenerationScreen(),
                          //4
                          const BodyTypeScreen(),
                          //5
                          const EngineScreen(),
                          //6
                          const DriveTypeScreen(),
                          //7
                          const GearboxScreen(),
                          //8
                          const ModificationScreen(),
                          //9
                          const ColorsScreen(),
                          //10
                          AddPhotoScreen(onImageChanged: (v) {
                            postingAdBloc.add(PostingAdChooseEvent(gallery: v));
                          }),
                          //11
                          const PtsScreen(),
                          //12
                          DescriptionScreen(
                              initialText: state.description ?? ''),
                          //13
                          const EquipmentScreen(),
                          //14
                          const DamageScreen(),
                          //15
                          ContactScreen(
                            initialEmail: state.ownerEmail ?? '',
                            initialName: state.ownerName ?? '',
                            initialPhone: state.ownerPhone ?? '',
                          ),
                          //16
                          InspectionPlaceScreen(
                            onToMapPressed: () {
                              Navigator.push(
                                context,
                                fade(
                                  page: const MapScreenPostingAd(),
                                ),
                              ).then((latLongZoom) {
                                if (latLongZoom is List<double>) {
                                  postingAdBloc.add(
                                    PostingAdGetMapScreenShotEvent(
                                        lat: latLongZoom[0],
                                        long: latLongZoom[1],
                                        zoomLevel: latLongZoom[2]),
                                  );
                                }
                              });
                            },
                          ),
                          //17
                          PriceScreen(initialPrice: state.price ?? ''),
                          //18
                          MileageScreen(initialMilage: state.mileage ?? ''),
                          // //19
                          // const StsScreen(),
                          //19
                          const PreviewScreen(),
                        ],
                      ),
                      if (currentTabIndex < tabLength - 1) ...{
                        Positioned(
                          bottom: 16,
                          right: 16,
                          left: 16,
                          child: WButton(
                            disabledColor: disabledButton,
                            isDisabled: state.buttonStatus(currentTabIndex),
                            onTap: () {
                              if (currentTabIndex < tabLength - 1) {
                                currentTabIndex++;
                                postingAdBloc.add(PostingAdAddEventForEveryPage(
                                    page: currentTabIndex));
                                pageController.animateToPage(currentTabIndex,
                                    duration: const Duration(milliseconds: 150),
                                    curve: Curves.linear);
                                setState(() {});
                              }
                            },
                            text: 'Далее',
                            shadow: state.buttonStatus(currentTabIndex)
                                ? null
                                : [
                                    BoxShadow(
                                        offset: const Offset(0, 4),
                                        blurRadius: 20,
                                        color: orange.withOpacity(0.2)),
                                  ],
                          ),
                        ),
                      } else ...{
                        Positioned(
                            bottom: MediaQuery.of(context).padding.bottom + 16,
                            right: 16,
                            left: 16,
                            child: WButton(
                              isLoading: state.createStatus ==
                                  FormzStatus.submissionInProgress,
                              onTap: () async {
                                postingAdBloc.add(PostingAdCreateEvent());
                                // Navigator.pop(context);
                                // HomeTabControllerProvider.of(context)
                                //     .controller
                                //     .animateTo(4);

                                // await Navigator.push(context, fade(page: const MyAddsPage()));
                              },
                              text: 'Разместить бесплатно на 7 дней....',
                              shadow: [
                                BoxShadow(
                                    offset: const Offset(0, 4),
                                    blurRadius: 20,
                                    color: orange.withOpacity(0.2)),
                              ],
                            )),
                      }
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
