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
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand_page.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
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
    required this.makeName,
    required this.modelName,
    required this.makeLogo,
    required this.makeId,
    required this.modelId,
    required this.bodyType,
    required this.gearboxType,
    required this.driveType,
    required this.yearValues,
    required this.priceValues,
    required this.currency,
    required this.isFilter,
    required this.regions,
  });

  final Size size;
  final ThemedColors theme;
  final TabController tabController;
  final AnnouncementListBloc bloc;
  final bool? isNew;
  final String makeName;
  final String modelName;
  final String makeLogo;
  final int? makeId;
  final int? modelId;
  final BodyTypeEntity? bodyType;
  final GearboxTypeEntity? gearboxType;
  final DriveTypeEntity? driveType;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final Currency currency;
  final bool isFilter;
  final List<Region> regions;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Column(
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
              title: makeName,
              subtitle: modelName,
              imageUrl: makeLogo,
              onTap: () async {
                final res = await Navigator.push(
                    context,
                    fade(
                        page: ChooseCarBrandPage(
                      selectedMakeId: makeId,
                      selectedModelId: modelId,
                    )));
                if (res is Map<String, dynamic>) {
                  var historySaved = res['modelId'] == modelId;
                  historySaved = res['makeId'] == makeId;
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
                    bodyType: bodyType,
                    gearboxType: gearboxType,
                    carDriveType: driveType,
                    yearValues: yearValues,
                    priceValues: priceValues,
                    currency: currency,
                    isCheck: isFilter,
                  ),
                ),
              );
              if (res is Map<String, dynamic>) {
                bloc.add(SetFilter(
                  bodyType: res['bodyType'],
                  gearboxType: res['gearboxType'],
                  driveType: res['carDriveType'],
                  yearValues: res['yearValues'],
                  priceValues: res['priceValues'],
                  currency: res['currency'],
                  isFilter: res['isFilter'] || isFilter,
                ));
              }
            },
            onTapClear1: () {
              if (isFilter) {
                bloc.add(ClearFilter(isNew));
              }
            },
            isFilter: isFilter,
            name: regions.isNotEmpty
                ? regions[0].title
                : '',
            regions: regions,
            onTapParams2: () async {
              await showModalBottomSheet<List<Region>>(
                isDismissible: false,
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (c) => RentChooseRegionBottomSheet(
                  checkedRegions: regions.asMap(),
                  list: context.read<RegionsBloc>().state.regions,
                ),
              ).then((value) {
                if (value != regions) {
                  bloc.add(SetRegions(regions: value ?? [], isNew: isNew));
                }
              });
            },
            onTapClear2: () {
              bloc.add(SetRegions(regions: [], isNew: isNew));
            },
          ),
        ],
      );

  @override
  double get maxExtent => 184;

  @override
  double get minExtent => 184;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
