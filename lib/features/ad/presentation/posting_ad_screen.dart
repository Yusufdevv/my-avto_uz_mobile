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
import 'package:auto/features/ad/domain/usecases/minimum_price_usecase.dart';
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
import 'package:auto/features/ad/presentation/pages/mileage/mileage_screen.dart';
import 'package:auto/features/ad/presentation/pages/modification/modification_screen.dart';
import 'package:auto/features/ad/presentation/pages/preview/preview_screen.dart';
import 'package:auto/features/ad/presentation/pages/price/price_screen.dart';
import 'package:auto/features/ad/presentation/pages/pts/pts_screen.dart';
import 'package:auto/features/ad/presentation/pages/year_of_issue/year_issue_screen.dart';
import 'package:auto/features/ad/presentation/widgets/completion_bar.dart';
import 'package:auto/features/ad/presentation/widgets/posting_ad_appbar.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/common/usecases/get_districts_usecase.dart';
import 'package:auto/features/common/usecases/get_regions.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/login/domain/usecases/verify_code.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/rent/domain/usecases/get_gearboxess_usecase.dart';
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
  static int initialPage = 0;
  // ChooseCarBrand,
  //1
  // ChooseCarModelScreen(makeId: state.makeId ?? -1),
  //2
  // YearIssueScreen(modelId: state.modelId ?? -1),
  //3
  // const GenerationScreen(),
  //4
  // CarcaseScreen(selectedBodyTypeId: state.bodyTypeId ?? -1),
  //5
  // const EngineScreen(),
  //6
  // const DriveTypeScreen(),
  //7
  // const GearboxScreen(),
  //8
  // const ModificationScreen(),
  //9
  // const ColorsScreen(),
  //10
  // AddPhotoScreen(onImageChanged: (v) {
  //   print(
  //       '=> => => =>  changing photos:   $v    <= <= <= <=');
  //   postingAdBloc.add(PostingAdChooseEvent(gallery: v));
  // }),
  //11
  // const PtsScreen(),
  //12
  // DescriptionScreen(initialText: state.descriptions ?? ''),
  //13
  // const EquipmentScreen(),
  // 14;
  // const DamageScreen(),
  // 15;
  // ContactScreen(
  //   initialEmail: state.ownerEmail ?? '',
  //   initialName: state.ownerName ?? '',
  //   initialPhone: state.ownerPhone ?? '',
  // ),
  // 16;
  // const InspectionPlaceScreen(),
  //17
  // PriceScreen(initialPrice: state.price ?? ''),
  //18
  // MileageScreen(initialMilage: state.mileage ?? ''),
  // //19
  // const StsScreen(),
  //19
  // PreviewScreen();
  int currentTabIndex = initialPage;
  final int tabLength = 20;
  @override
  void initState() {
    pageController = PageController(initialPage: initialPage);
    postingAdBloc = PostingAdBloc(
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
      postingAdBloc.add(PostingAdMakesEvent());
    } else {
      postingAdBloc
          .add(PostingAdGetAnnouncementEvent(id: widget.announcementId!));
    }
    super.initState();
  }

  bool _isDisabled(int page, PostingAdState state) {
//     switch (page) {
//       //make
//       case 0:
//         return state.makeId == null;
// // model
//       case 1:
//         return state.modelId == null;
//       // year
//       case 2:
//         return state.yearsEntity == null;
//       // body type
//       case 3:
//         return state.bodyTypeId == null;
//       // generation
//       case 4:
//         return state.generationId == null;
//       // engine
//       case 5:
//         return state.engineId == null;
//       // drive type
//       case 6:
//         return state.driveTypeId == null;
//       // gearbox
//       case 7:
//         return state.gearboxId == null;
//       case 15:
//         return state.isContactsVerified??false;
//     }

    return false;
  }

  void addEvent(int page, PostingAdState state) {
    switch (page) {
      case 0:
        postingAdBloc.add(PostingAdMakesEvent());
        break;
      case 1:
        postingAdBloc.add(PostingAdModelEvent());
        break;
      case 2:
        break;
      case 3:
        postingAdBloc.add(PostingAdGenerationsEvent(modelId: state.modelId!));
        break;
      case 4:
        postingAdBloc.add(PostingAdBodyTypesEvent());
        break;
      case 5:
        postingAdBloc.add(PostingAdEnginesEvent());
        break;
      case 6:
        postingAdBloc.add(PostingAdDriveTypesEvent());
        break;
      case 7:
        postingAdBloc.add(PostingAdGearBoxesEvent());
        break;
      case 16:
        postingAdBloc.add(PostingAdGetRegionsEvent());
        break;
      case 17:
        postingAdBloc.add(PostingAdGetMinimumPriceEvent());
        break;
    }
  }

  List<String> tabs = [
    'Марку автомобиля',
    'Модель автомобиля',
    'Год выпуска',
    'Поколение',
    'Кузов',
    'Двигатель',
    'Привод',
    'Коробка передач',
    'Модификация',
    'Цвет автомобиля',
    'Фотографии',
    'ПТС',
    'Описание',
    'Комплектация',
    'Состояние кузова',
    'Контактные данные',
    'Место осмотра',
    'Цена',
    'Пробег',
    'Предосмотор',
  ];

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor:
              Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: BlocProvider.value(
          value: postingAdBloc,
          child: BlocBuilder<PostingAdBloc, PostingAdState>(
            builder: (context, state) => Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostingAdAppBar(
                      backgroundColor: white,
                      hasShadow: state.hasAppBarShadow,
                      hasBackButton: currentTabIndex != 0,
                      onTapBack: () {
                        --currentTabIndex;
                        addEvent(currentTabIndex, state);
                        pageController.animateToPage(currentTabIndex,
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.linear);
                        setState(() {});
                      },
                      title:
                          currentTabIndex == 0 ? '' : tabs[currentTabIndex - 1],
                    ),
                    CompletionBar(
                      visibile: state.hasAppBarShadow,
                      screenWidth: MediaQuery.of(context).size.width,
                      totalSteps: tabLength,
                      currentStep: currentTabIndex + 1,
                      progressBarColor: orange,
                    ),
                  ],
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
                        bloc: postingAdBloc,
                        onTopBrandPressed: () {
                          currentTabIndex++;
                          addEvent(currentTabIndex, state);
                          pageController.animateToPage(currentTabIndex,
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.linear);
                          setState(() {});
                        },
                      ),
                      //1
                      ChooseCarModelScreen(makeId: state.makeId ?? -1),
                      //2
                      YearIssueScreen(modelId: state.modelId ?? -1),
                      //3
                      const GenerationScreen(),
                      //4
                      CarcaseScreen(selectedBodyTypeId: state.bodyTypeId ?? -1),
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
                      DescriptionScreen(initialText: state.description ?? ''),
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
                      const InspectionPlaceScreen(),
                      //17
                      PriceScreen(initialPrice: state.price ?? ''),
                      //18
                      MileageScreen(initialMilage: state.mileage ?? ''),
                      // //19
                      // const StsScreen(),
                      //19
                      PreviewScreen()
                    ],
                  ),
                  if (currentTabIndex < tabLength - 1) ...{
                    Positioned(
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: WButton(
                        disabledColor: disabledButton,
                        isDisabled: _isDisabled(currentTabIndex, state),
                        onTap: () {
                          // print(
                          //     '=>=>=>=> ${currentTabIndex} / ${tabLength} /  <=<=<=<=');
                          if (currentTabIndex < tabLength - 1) {
                            currentTabIndex++;
                            addEvent(currentTabIndex, state);
                            pageController.animateToPage(currentTabIndex,
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.linear);
                            setState(() {});
                          }
                        },
                        text: 'Далее',
                        shadow: _isDisabled(currentTabIndex, state)
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
                          isLoading:
                              state.status == FormzStatus.submissionInProgress,
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
      );
}
