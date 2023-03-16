// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/features/dealers/domain/entities/dealer_card_entity.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/get_directories_map_point_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/get_map_dealers.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_card_bloc/dealer_card_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/filter_bloc/dealer_filter_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_filter.dart';
import 'package:auto/features/dealers/presentation/pages/dealers_list.dart';
import 'package:auto/features/dealers/presentation/pages/map_screen.dart';
import 'package:auto/features/dealers/presentation/widgets/segmented_control.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class DealerScreen extends StatefulWidget {
  const DealerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DealerScreen> createState() => _DealerScreenState();
}

class _DealerScreenState extends State<DealerScreen>
    with TickerProviderStateMixin {
  late DealerCardBloc deallerCardBloc;
  late DealerFilterBloc filterBloc;
  late MapOrganizationBloc mapOrganizationBloc;
  late TextEditingController controller;
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    controller = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();

    deallerCardBloc = DealerCardBloc(DealerUseCase());
    mapOrganizationBloc = MapOrganizationBloc(
      GetMapDealersUseCase(),
      GetDirectoriesMapPointUseCase(),
    );
    filterBloc = DealerFilterBloc();
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        FocusScope.of(context).unfocus();
        controller.clear();
      }
      deallerCardBloc
          .add(DealerCardEvent.changeTabIndex(index: _tabController.index));
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _tabController.dispose();
    deallerCardBloc.close();
    filterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: deallerCardBloc),
          BlocProvider.value(value: filterBloc),
          BlocProvider.value(value: mapOrganizationBloc),
        ],
        child: BlocConsumer<DealerCardBloc, DealerCardState>(
          listener: (context, state) {},
          builder: (context, state) => AnnotatedRegion(
            value:
                const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            child: KeyboardDismisser(
              child: Scaffold(
                body: CustomScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      automaticallyImplyLeading: false,
                      backgroundColor: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToNero,
                      leadingWidth: 0,
                      title: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => Navigator.pop(context),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SvgPicture.asset(AppIcons.chevronLeft),
                              ),
                            ),
                            const SizedBox(width: 7),
                            Expanded(
                              child: WTextField(
                                readOnly: state.isIndexOne ?? false,
                                contentPadding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 12),
                                borderColor: purple,
                                disabledBorderColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToEclipse,
                                fillColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToEclipse,
                                hintText: LocaleKeys.autosalon.tr(),
                                hintTextStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: grey),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: black,
                                ),
                                enabledBorderColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToEclipse,
                                focusColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToEclipse,
                                onChanged: (value) {
                                  deallerCardBloc
                                      .add(DealerCardEvent.getResults(
                                          isRefresh: false,
                                          search: value,
                                          onSuccess: (list) {
                                            mapOrganizationBloc.add(
                                                MapOrganizationEvent.setMapPoints(
                                                    list: list
                                                        .map((e) => DealerCardModel
                                                            .fromJson(
                                                                const DealerCardConvert()
                                                                    .toJson(e)))
                                                        .toList()));
                                          }));
                                },
                                controller: controller,
                                hasSearch: true,
                                borderRadius: 8,
                              ),
                            ),
                            const SizedBox(width: 12),
                            BlocBuilder<DealerFilterBloc, DealerFilterState>(
                              builder: (context, filterState) => WButton(
                                height: 50,
                                width: 50,
                                onTap: () {
                                  context
                                      .read<RegionsBloc>()
                                      .add(RegionsEvent.getRegions());
                                  Navigator.push(
                                    context,
                                    fade(
                                      page: BlocProvider.value(
                                        value: filterBloc,
                                        child: DealersFilterScreen(
                                          dealerFilterBloc: filterBloc,
                                          dealerBloc: deallerCardBloc,
                                          mapOrganizationBloc:
                                              mapOrganizationBloc,
                                          maker: filterState.maker,
                                          regions: filterState.region,
                                          carType: filterState.carType == ''
                                              ? 'all'
                                              : filterState.carType,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                borderRadius: 12,
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToNightRider,
                                // color: Colors.teal,
                                padding: const EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                  AppIcons.delaerFilter,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SegmentedControl(
                          maxHeight: 64,
                          minHeight: 64,
                          tabController: _tabController,
                          pageController: _pageController),
                    ),
                    SliverFillRemaining(
                      child: PageView(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const DealersList(),
                          const MapScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
