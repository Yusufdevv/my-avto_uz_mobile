import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
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
import 'package:auto/features/ad/presentation/pages/sts/sts_screen.dart';
import 'package:auto/features/ad/presentation/pages/year_of_issue/year_issue_screen.dart';
import 'package:auto/features/ad/presentation/widgets/completion_bar.dart';
import 'package:auto/features/ad/presentation/widgets/posting_ad_appbar.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class PostingAdScreen extends StatefulWidget {
  const PostingAdScreen({Key? key}) : super(key: key);

  @override
  State<PostingAdScreen> createState() => _PostingAdScreenState();
}

class _PostingAdScreenState extends State<PostingAdScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentTabIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 21, vsync: this);
    super.initState();
  }

  List<String> tabs = [
    'Выберите марку автомобиля',
    'Выберите модель',
    'Год выпуска',
    'Кузов',
    'Поколение',
    'Двигатель',
    'Привод',
    'Коробка передач',
    'Модификация',
    'Цвет',
    'Фото',
    'ПТС',
    'Описание',
    'Комплектация',
    'Повреждения',
    'Контакты',
    'Место осмотра',
    'Цена',
    'Пробег',
    'СТС',
    'Предосмотор',
  ];
  void onNextPressed() {
    currentTabIndex++;

    tabController.animateTo(currentTabIndex);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor:
              Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostingAdAppBar(
                  onTapBack: () {
                    if (currentTabIndex == 0) {
                      // Navigator.pop(context);
                    } else {
                      print(
                          '=>=>=>=> currentTab index $currentTabIndex <=<=<=<=');
                      --currentTabIndex;
                      tabController.animateTo(currentTabIndex);
                      setState(() {});
                    }
                  },
                  title: currentTabIndex == 0 ? '' : tabs[currentTabIndex - 1],
                  extraActions: [
                    if (currentTabIndex > 1)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: WScaleAnimation(
                            child: SvgPicture.asset(
                              AppIcons.close,
                            ),
                            onTap: () {
                              // Navigator.pop(context);
                            }),
                      )
                    else
                      const SizedBox()
                  ],
                ),
                // Container(
                //   color: Theme.of(context).appBarTheme.backgroundColor,
                //   // color: Colors.amber,
                //   padding: const EdgeInsets.symmetric(vertical: 15),
                //   child: TabBar(
                //     onTap: (index) {
                //        print('=>=>=>=> index ${tabController.index} <=<=<=<=');
                //        print('=>=>=>=> privious index ${tabController.previousIndex} <=<=<=<=');
                //       currentTabIndex = index;
                //       tabController..index = tabController.previousIndex
                //       ..animateTo(currentTabIndex);
                //       setState(() {});
                //     },
                //     isScrollable: true,
                //     indicatorColor: Theme.of(context).appBarTheme.backgroundColor,
                //     controller: tabController,
                //     labelStyle: Theme.of(context)
                //         .textTheme
                //         .headline1!
                //         .copyWith(fontSize: 16),
                //     unselectedLabelColor: grey,
                //     labelColor: Theme.of(context)
                //         .extension<ThemedColors>()!
                //         .midnightExpressToWhite,
                //     tabs: List.generate(
                //       21,
                //       (index) => index == 10
                //           ? Row(
                //               children: [
                //                 Text(tabs[index],
                //                     style: currentTabIndex > index
                //                         ? Theme.of(context)
                //                             .textTheme
                //                             .headline1!
                //                             .copyWith(fontSize: 12, color: green)
                //                         : const TextStyle()),
                //                 const SizedBox(
                //                   width: 4,
                //                 ),
                //                 WScaleAnimation(
                //                     onTap: () => Navigator.push(
                //                         context,
                //                         MaterialPageRoute(
                //                             builder: (context) =>
                //                                 const AddingPhotoScreen())),
                //                     child: SvgPicture.asset(AppIcons.infoCircle)),
                //               ],
                //             )
                //           : Text(
                //               tabs[index],
                //               style: currentTabIndex > index
                //                   ? Theme.of(context)
                //                       .textTheme
                //                       .headline1!
                //                       .copyWith(fontSize: 12, color: green)
                //                   : const TextStyle(),
                //             ),
                //     ),
                //   ),
                // ),
                CompletionBar(
                    screenWidth: MediaQuery.of(context).size.width,
                    totalSteps: 21,
                    currentStep: currentTabIndex + 1,
                    progressBarColor: orange),
              ],
            ),
          ),
          body: Stack(
            children: [
              TabBarView(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const ChooseCarBrand(),
                  const ChooseCarModelScreen(),
                  const YearIssueScreen(),
                  const CarcaseScreen(),
                  const GenerationScreen(),
                  const EngineScreen(),
                  const DriveTypeScreen(),
                  const GearboxScreen(),
                  const ModificationScreen(),
                  const ColorsScreen(),
                  const AddPhotoScreen(),
                  const PtsScreen(),
                  const DescriptionScreen(),
                  const EquipmentScreen(),
                  const DamageScreen(),
                  const ContactScreen(),
                  const InspectionPlaceScreen(),
                  const PriceScreen(),
                  const MileageScreen(),
                  const StsScreen(),
                  PreviewScreen()
                ],
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: WButton(
                  onTap: onNextPressed,
                  text: 'Далее',
                  shadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 20,
                        color: orange.withOpacity(0.2)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
