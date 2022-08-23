import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/posting_ad/add_photo/presentation/pages/add_photo_screen.dart';
import 'package:auto/features/posting_ad/adding_photo/presentation/pages/adding_photo_screen.dart';
import 'package:auto/features/posting_ad/carcase/presentation/pages/carcase_screen.dart';
import 'package:auto/features/posting_ad/choose_car_brand/presentation/pages/choose_brand_screen.dart';
import 'package:auto/features/posting_ad/choose_model/presentation/pages/choose_car_model.dart';
import 'package:auto/features/posting_ad/color/presentation/pages/colors_screen.dart';
import 'package:auto/features/posting_ad/contact/presentation/pages/contact_screen.dart';
import 'package:auto/features/posting_ad/damage/presentation/pages/damage_screen.dart';
import 'package:auto/features/posting_ad/description/presentation/pages/description_screen.dart';
import 'package:auto/features/posting_ad/engine/presentation/pages/engine_screen.dart';
import 'package:auto/features/posting_ad/equipment/presentation/pages/equipment_screen.dart';
import 'package:auto/features/posting_ad/gear_box/presentation/pages/gearbox_screen.dart';
import 'package:auto/features/posting_ad/generation/presentation/pages/generation_screen.dart';
import 'package:auto/features/posting_ad/inspection_place/presentation/pages/inspection_place_screen.dart';
import 'package:auto/features/posting_ad/mileage/presentation/pages/mileage_screen.dart';
import 'package:auto/features/posting_ad/modification/presentation/pages/modification_screen.dart';
import 'package:auto/features/posting_ad/presentation/widgets/completion_bar.dart';
import 'package:auto/features/posting_ad/preview/presentation/pages/preview_screen.dart';
import 'package:auto/features/posting_ad/price/presentation/pages/price_screen.dart';
import 'package:auto/features/posting_ad/pts/presentation/pages/pts_screen.dart';
import 'package:auto/features/posting_ad/sts/presentation/pages/sts_screen.dart';
import 'package:auto/features/posting_ad/transmission/presentation/pages/generation_screen.dart';
import 'package:auto/features/posting_ad/year_of_issue/presentation/pages/year_issue_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostingAdScreen extends StatefulWidget {

  const PostingAdScreen(
      { Key? key})
      : super(key: key);

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
    'Предосмотор'
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(108),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WAppBar(
                onTapBack: () {
                  if (currentTabIndex == 0) {
                    Navigator.pop(context);
                  } else {
                    --currentTabIndex;
                    tabController.animateTo(currentTabIndex);
                  }
                },
                extraActions: [
                  if (currentTabIndex > 1)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: WScaleAnimation(
                          child: SvgPicture.asset(
                            AppIcons.close,
                          ),
                          onTap: () => Navigator.pop(context)),
                    )
                  else
                    const SizedBox()
                ],
              ),
              Container(
                color: Theme.of(context).appBarTheme.backgroundColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: TabBar(
                  onTap: (index) {
                    // currentTabIndex = index;
                    tabController.index = tabController.previousIndex;
                  },
                  isScrollable: true,
                  indicatorColor: Theme.of(context).appBarTheme.backgroundColor,
                  controller: tabController,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                  unselectedLabelColor: grey,
                  labelColor: Theme.of(context)
                      .extension<ThemedColors>()!
                      .midnightExpressToWhite,
                  tabs: List.generate(
                    21,
                    (index) => index == 10
                        ? Row(
                            children: [
                              Text(tabs[index],
                                  style: currentTabIndex > index
                                      ? Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(fontSize: 12, color: green)
                                      : const TextStyle()),
                              const SizedBox(
                                width: 4,
                              ),
                              WScaleAnimation(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddingPhotoScreen())),
                                  child: SvgPicture.asset(AppIcons.infoCircle)),
                            ],
                          )
                        : Text(
                            tabs[index],
                            style: currentTabIndex > index
                                ? Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 12, color: green)
                                : const TextStyle(),
                          ),
                  ),
                ),
              ),
              CompletionBar(
                  screenWidth: MediaQuery.of(context).size.width,
                  totalSteps: 21,
                  currentStep: currentTabIndex + 1,
                  progressBarColor: orange),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ChooseCarBrand(
              onTap: () => setState(() {
                currentTabIndex = 1;
                tabController.animateTo(1);
              }),
            ),
            ChooseCarModelScreen(
              onTap: () => setState(() {
                currentTabIndex = 2;
                tabController.animateTo(2);
              }),
            ),
            YearIssueScreen(
              onTap: () => setState(() {
                currentTabIndex = 3;
                tabController.animateTo(3);
              }),
            ),
            CarcaseScreen(
              onTap: () => setState(() {
                currentTabIndex = 4;
                tabController.animateTo(4);
              }),
            ),
            GenerationScreen(
              onTap: () => setState(() {
                currentTabIndex = 5;
                tabController.animateTo(5);
              }),
            ),
            EngineScreen(
              onTap: () => setState(() {
                currentTabIndex = 6;
                tabController.animateTo(6);
              }),
            ),
            TransmissionScreen(
              onTap: () => setState(() {
                currentTabIndex = 7;
                tabController.animateTo(7);
              }),
            ),
            GearboxScreen(
              onTap: () => setState(() {
                currentTabIndex = 8;
                tabController.animateTo(8);
              }),
            ),
            ModificationScreen(
              onTap: () => setState(() {
                currentTabIndex = 9;
                tabController.animateTo(9);
              }),
            ),
            ColorsScreen(
              onTap: () => setState(() {
                currentTabIndex = 10;
                tabController.animateTo(10);
              }),
            ),
            AddPhotoScreen(
              onTap: () => setState(() {
                currentTabIndex = 11;
                tabController.animateTo(11);
              }),
            ),
            PtsScreen(
              onTap: () => setState(() {
                currentTabIndex = 12;
                tabController.animateTo(12);
              }),
            ),
            DescriptionScreen(
              onTap: () => setState(() {
                currentTabIndex = 13;
                tabController.animateTo(13);
              }),
            ),
            EquipmentScreen(
              onTap: () => setState(() {
                currentTabIndex = 14;
                tabController.animateTo(14);
              }),
            ),
            DamageScreen(
              onTap: () => setState(() {
                currentTabIndex = 15;
                tabController.animateTo(15);
              }),
            ),
            ContactScreen(
              onTap: () => setState(() {
                currentTabIndex = 16;
                tabController.animateTo(16);
              }),
            ),
            InspectionPlaceScreen(
              onTap: () => setState(() {
                currentTabIndex = 17;
                tabController.animateTo(17);
              }),
            ),
            PriceScreen(
              onTap: () => setState(() {
                currentTabIndex = 18;
                tabController.animateTo(18);
              }),
            ),
            MileageScreen(
              onTap: () => setState(() {
                currentTabIndex = 19;
                tabController.animateTo(19);
              }),
            ),
            StsScreen(
              onTap: () => setState(() {
                currentTabIndex = 20;
                tabController.animateTo(20);
              }),
            ),
            PreviewScreen()
          ],
        ),
      );
}
