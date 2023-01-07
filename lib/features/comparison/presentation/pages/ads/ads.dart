import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/car_type_selector_bloc.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_tab.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/comparison/presentation/bloc/filter_parameters_bloc/bloc/filter_parameters_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/ads/ads_body_screen.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  SortSearchResultStatus? sortingValue = SortSearchResultStatus.cheapest;
  late FilterParametersBloc filterParametersBlock;

  @override
  void initState() {
    filterParametersBlock = FilterParametersBloc();
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => filterParametersBlock,
        child: KeyboardDismisser(
          child: AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor:
                  Theme.of(context).extension<ThemedColors>()!.whiteToDark,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(98),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WAppBar(
                      title: 'Объявления',
                      centerTitle: false,
                      extraActions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: WScaleAnimation(
                            onTap: () {
                              filterBottomSheet(context);
                            },
                            child: SvgPicture.asset(
                              AppIcons.arrowsSort,
                              width: 20,
                              height: 20,
                              color: orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CommercialTab(
                      tabController: tabController,
                      tabLabels: const ['Все', 'Новые', 'С пробегом'],
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                controller: tabController,
                children: [
                  AdsBodyScreen(
                    filterParametersBloc: filterParametersBlock,
                  ),
                  AdsBodyScreen(
                    filterParametersBloc: filterParametersBlock,
                  ),
                  AdsBodyScreen(
                    filterParametersBloc: filterParametersBlock,
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: orange,
                onPressed: () {},
                child: SvgPicture.asset(
                  AppIcons.searchWithHeartWhite,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startFloat,
            ),
          ),
        ),
      );

  Future<dynamic> filterBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        backgroundColor: LightThemeColors.appBarColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        clipBehavior: Clip.hardEdge,
        builder: (context) => SortBottomSheet(
          title: 'Сортировка',
          values: const [
            SortSearchResultsModel(
              title: 'По убыванию',
              status: SortSearchResultStatus.cheapest,
            ),
            SortSearchResultsModel(
              title: 'По возрастанию',
              status: SortSearchResultStatus.expensive,
            ),
            SortSearchResultsModel(
              title: 'Сначала старые',
              status: SortSearchResultStatus.oldest,
            ),
            SortSearchResultsModel(
              title: 'Сначала новые',
              status: SortSearchResultStatus.newest,
            ),
          ],
          onChanged: (value) => setState(() => sortingValue = value),
          defaultValue: sortingValue,
        ),
      );
}
