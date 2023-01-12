import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
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
import 'package:auto/features/ad/presentation/pages/sts/sts_screen.dart';
import 'package:auto/features/ad/presentation/pages/year_of_issue/year_issue_screen.dart';
import 'package:auto/features/ad/presentation/widgets/completion_bar.dart';
import 'package:auto/features/ad/presentation/widgets/posting_ad_appbar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PostingAdScreen extends StatefulWidget {
  const PostingAdScreen({Key? key}) : super(key: key);

  @override
  State<PostingAdScreen> createState() => _PostingAdScreenState();
}

class _PostingAdScreenState extends State<PostingAdScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late PostingAdBloc postingAdBloc;
  int currentTabIndex = 0;
  final int tabLength = 21;
  @override
  void initState() {
    postingAdBloc = PostingAdBloc();
    tabController = TabController(length: tabLength, vsync: this);
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
    if (currentTabIndex < tabLength - 1) {
      currentTabIndex++;

      tabController.animateTo(currentTabIndex);
      setState(() {});
    }
  }

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
                preferredSize: Size.fromHeight(state.hasAppBarShadow ? 55 : 52),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostingAdAppBar(
                      backgroundColor: white,
                      hasShadow: state.hasAppBarShadow,
                      hasBackButton: currentTabIndex != 0,
                      onTapBack: () {
                        --currentTabIndex;
                        tabController.animateTo(currentTabIndex);
                        setState(() {});
                      },
                      title:
                          currentTabIndex == 0 ? '' : tabs[currentTabIndex - 1],
                      extraActions: [
                        if (currentTabIndex > 0)
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
                    if (state.hasAppBarShadow) ...{
                      CompletionBar(
                        screenWidth: MediaQuery.of(context).size.width,
                        totalSteps: 21,
                        currentStep: currentTabIndex + 1,
                        progressBarColor: orange,
                      ),
                    }
                  ],
                ),
              ),
              body: Stack(
                children: [
                  TabBarView(
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ChooseCarBrand(bloc: postingAdBloc),
                      const ChooseCarModelScreen(),
                      const YearIssueScreen(modelId: 10),
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
          ),
        ),
      );
}
