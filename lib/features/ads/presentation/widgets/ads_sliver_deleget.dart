import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
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
    required this.isNew,
  });

  final Size size;
  final ThemedColors theme;
  final TabController tabController;
  final AnnouncementListBloc bloc;
  final bool? isNew;

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
                    bloc.add(SetMakeModel(
                      makeId: -1,
                      modelId: -1,
                      makeName: '',
                      makeLogo: '',
                      modelName: '',
                      isNew: isNew,
                      historySaved: true,
                    ));
                  },
                  title: state.makeName ?? '',
                  subtitle: state.modelName ?? '',
                  imageUrl: state.makeLogo ?? '',
                  onTap: () async {
                    final res = await Navigator.push(
                        context,
                        fade(
                            page: ChooseCarBrandPage(
                          selectedMakeId: state.makeIdd,
                          selectedModelId: state.modelId,
                        )));
                    if (res is Map<String, dynamic>) {
                      var historySaved = res['modelId'] == state.modelId;
                      historySaved = res['makeId'] == state.makeIdd;
                      bloc.add(SetMakeModel(
                        makeId: res['makeId'],
                        modelId: res['modelId'],
                        makeName: res['makeName'],
                        modelName: res['modelName'],
                        makeLogo: res['makeLogo'],
                        isNew: isNew,
                        historySaved: historySaved,
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
                        bodyType: state.bodyType,
                        gearboxType: state.gearboxType,
                        carDriveType: state.driveType,
                        yearValues: state.yearValues,
                        priceValues: state.priceValues,
                        currency: state.currency ?? Currency.none,
                        isCheck: state.isFilter,
                      ),
                    ),
                  );
                  if (res is Map<String, dynamic>) {
                    var historySaved = !res['isFilter'];

                    historySaved = state.makeIdd == null;
                    bloc.add(SetFilter(
                        bodyType: res['bodyType'] ?? const BodyTypeEntity(),
                        gearboxType:
                            res['gearboxType'] ?? const GearboxTypeEntity(),
                        driveType:
                            res['carDriveType'] ?? const DriveTypeEntity(),
                        yearValues: res['yearValues'],
                        priceValues: res['priceValues'],
                        currency: res['currency'],
                        isFilter: res['isFilter'],
                        historySaved: historySaved));
                  }
                },
                onTapClear1: () {
                  if (state.isFilter) {
                    bloc.add(ClearFilter(isNew));
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
                      bloc.add(SetRegions(regions: value, isNew: isNew));
                    }
                  });
                },
                onTapClear2: () {
                  bloc.add(SetRegions(regions: [], isNew: isNew));
                },
              ),
            ],
          ),
        ),
      );

  @override
  double get maxExtent => 187;

  @override
  double get minExtent => 187;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
