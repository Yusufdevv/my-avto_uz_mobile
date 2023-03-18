import 'dart:developer';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ads/presentation/bloc/filter/filter_bloc.dart';
import 'package:auto/features/ads/presentation/pages/filter_parameters.dart';
import 'package:auto/features/ads/presentation/widgets/filters_buttons_widget.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_car_model_item.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_tab.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand_page.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsSliverWidget extends SliverPersistentHeaderDelegate {
  AdsSliverWidget({
    required this.size,
    required this.theme,
    required this.tabController,
    required this.bloc,
  });

  final Size size;
  final ThemedColors theme;
  final TabController tabController;
  final AnnouncementListBloc bloc;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      BlocProvider.value(
        value: bloc,
        child: BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
          builder: (context, state) => Column(
            children: [
              CommercialTab(
                tabController: tabController,
                tabLabels: [
                  LocaleKeys.all.tr(),
                  LocaleKeys.news.tr(),
                  LocaleKeys.with_Mileage.tr()
                ],
              ),
              CommercialCarModelItem(
                  onTapClear: () {
                    bloc.add(const SetMakeModel(
                      modelId: -1,
                      make: MakeEntity(),
                      modelName: '',
                      historySaved: true,
                    ));
                  },
                  title: state.make?.name ?? '',
                  subtitle: state.modelName ?? '',
                  imageUrl: state.make?.logo ?? '',
                  onTap: () async {
                    final res = await Navigator.push(
                      context,
                      fade(
                        page: ChooseCarBrandPage(
                          selectedMakeId: state.make?.id,
                          selectedModelId: state.modelId,
                        ),
                      ),
                    );

                    if (res is Map<String, dynamic>) {
                      var historySaved = res['modelId'] == state.modelId;
                      historySaved = res['makeId'] == state.make?.id;
                      bloc.add(SetMakeModel(
                        modelId: res['modelId'],
                        modelName: res['modelName'],
                        historySaved: historySaved,
                        make: res['make'],
                      ));
                    }
                  }),
              FilterButtonsWidget(
                size: size,
                theme: theme,
                onTapParams1: () async {
                  final res = await Navigator.of(context).push(
                    fade(
                      page: FilterParameters(
                        saleType: state.saleType,
                        bodyType: state.bodyType,
                        gearboxType: state.gearboxType,
                        carDriveType: state.driveType,
                        yearValues: state.yearValuess,
                        priceValues: state.priceValuess,
                        currency: state.currency ?? Currency.none,
                      ),
                    ),
                  );
                  if (res is FilterState) {
                    var historySaved = !res.isFilter;

                    historySaved =
                        state.make?.id == null || state.make?.id == -1;
                     if (res.isFilter) {
                      bloc.add(
                        SetFilter(
                          saleType: res.saleType,
                          bodyType: res.bodyType,
                          gearboxType: res.gearboxType,
                          driveType: res.driveType,
                          yearValues: res.yearValues,
                          priceValues: res.priceValues,
                          currency: res.currency,
                          isFilter: res.isFilter,
                          historySaved: historySaved,
                        ),
                      );
                    } else {
                      bloc.add(const ClearFilter());
                    }
                  }
                },
                onTapClear1: () {
                  if (state.isFilter) {
                    bloc.add(const ClearFilter());
                  }
                },
                isFilter: state.isFilter,
                name: state.regions.isNotEmpty ? state.regions[0].title : '',
                regions: state.regions,
                onTapParams2: () async {
                  await showModalBottomSheet<List<RegionEntity>>(
                    isDismissible: false,
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (c) => RentChooseRegionBottomSheet(
                      checkedRegions: state.regions.asMap(),
                      list: context.read<RegionsBloc>().state.regions,
                    ),
                  ).then((value) {
                    if (value != null && value != state.regions) {
                      bloc.add(SetRegions(regions: value));
                    }
                  });
                },
                onTapClear2: () {
                  bloc.add(const SetRegions(regions: []));
                },
              ),
            ],
          ),
        ),
      );

  @override
  double get maxExtent => 191;

  @override
  double get minExtent => 191;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
