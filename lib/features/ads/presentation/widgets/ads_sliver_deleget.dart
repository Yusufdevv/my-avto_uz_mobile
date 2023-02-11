import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ads/presentation/pages/filter_parameters.dart';
import 'package:auto/features/ads/presentation/widgets/filters_buttons_widget.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_car_model_item.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_tab.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
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
    required this.onSelectMakeModel,
    required this.bloc,
  });

  final Size size;
  final ThemedColors theme;
  final TabController tabController;
  final Function(int makeId, int modelId) onSelectMakeModel;
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
                  title: context.read<GetMakesBloc>().state.name,
                  subtitle: context.read<GetCarModelBloc>().state.name,
                  imageUrl: context.read<GetMakesBloc>().state.imageUrl,
                  onTap: () async {
                    final res = await Navigator.push(
                        context, fade(page: const ChooseCarBrandComparison()));
                    if (res is Map<String, dynamic>) {
                      onSelectMakeModel(res['makeId'], res['modelId']);
                    }
                  }),
              FilterButtonsWidget(
                size: size,
                theme: theme,
                onTapParams1: () async {
                  final res = await Navigator.of(context).push(
                    fade(
                      page: FilterParameters(
                        bloc: context.read<AnnouncementListBloc>(),
                        bodyType: state.bodyType,
                        gearboxType: state.gearboxType,
                        carDriveType: state.driveType,
                        yearValues: state.yearValues,
                        priceValues: state.priceValues,
                        currency: state.currency,
                        ischek: state.isFilter,
                      ),
                    ),
                  );
                  if (res is Map<String, dynamic>) {
                    bloc
                      ..add(
                        AnnouncementListEvent.setFilter(
                          bodyType: res['bodyType'],
                          gearboxType: res['gearboxType'],
                          driveType: res['carDriveType'],
                          yearValues: res['yearValues'],
                          priceValues: res['priceValues'],
                          currency: res['currency'],
                          isFilter: res['isFilter'],
                        ),
                      )
                      ..add(AnnouncementListEvent.getAnnouncementList(null));
                  }
                },
                onTapClear1: () {
                  bloc
                    ..add(AnnouncementListEvent.clearFilter())
                    ..add(AnnouncementListEvent.getAnnouncementList(null));
                },
                isFilter: state.isFilter,
                name: state.regions.isNotEmpty ? state.regions[0].title : '',
                regions: state.regions,
                onTapParams2: () async {
                  await showModalBottomSheet<List<Region>>(
                    isDismissible: false,
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (c) => RentChooseRegionBottomSheet(
                      checkedRegions: state.regions.asMap(),
                      list: context.read<RegionsBloc>().state.regions,
                    ),
                  ).then((value) {
                    bloc
                      ..add(AnnouncementListEvent.setRegions(value ?? []))
                      ..add(AnnouncementListEvent.getAnnouncementList(null));
                  });
                },
                onTapClear2: () {
                  bloc
                    ..add(AnnouncementListEvent.setRegions([]))
                    ..add(AnnouncementListEvent.getAnnouncementList(null));
                },
              ),
            ],
          ),
        ),
      );

  @override
  double get maxExtent => 184;

  @override
  double get minExtent => 184;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
