import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ads/presentation/pages/filter_parameters.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/w_filter_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterButtonsWidget extends StatelessWidget {
  const FilterButtonsWidget({
    required this.size,
    required this.theme,
    Key? key,
  }) : super(key: key);

  final Size size;
  final ThemedColors theme;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WFilterButton(
                size: size,
                theme: theme,
                icon: AppIcons.filter,
                name: '',
                claerA: state.isFilter,
                activeColor: orange,
                defaultTitle: 'Параметры',
                onTap: () {
                  Navigator.of(context).push(
                    fade(
                      page: FilterParameters(
                        bloc: context.read<AnnouncementListBloc>(),
                        bodyType: state.bodyTypeEntity,
                        gearboxType: state.gearboxTypeEntity,
                        carDriveType: state.driveTypeEntity,
                        yearValues: state.yearValues,
                        priceValues: state.priceValues,
                        idVal: state.idVal,
                        ischek: state.isFilter,
                      ),
                    ),
                  );
                },
                onTapClear: () {
                  context
                      .read<AnnouncementListBloc>()
                      .add(AnnouncementListEvent.getInfo(isFilter: false));
                  context
                      .read<AnnouncementListBloc>()
                      .add(AnnouncementListEvent.getFilterClear());
                  context
                      .read<AnnouncementListBloc>()
                      .add(AnnouncementListEvent.getAnnouncementList());
                },
              ),
              WFilterButton(
                size: size,
                theme: theme,
                icon: AppIcons.location,
                name: state.regions.isNotEmpty ? state.regions[0].title : '',
                claerA: state.regions.isNotEmpty,
                activeColor: dark,
                defaultTitle: 'Все регионы',
                onTap: () async {
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
                    context
                        .read<AnnouncementListBloc>()
                        .add(AnnouncementListEvent.getRegions(value!));
                    context
                        .read<AnnouncementListBloc>()
                        .add(AnnouncementListEvent.getAnnouncementList());
                  });
                },
                onTapClear: () {
                  context
                      .read<AnnouncementListBloc>()
                      .add(AnnouncementListEvent.getRegions([]));
                  context
                      .read<AnnouncementListBloc>()
                      .add(AnnouncementListEvent.getAnnouncementList());
                },
              ),
            ],
          ),
        ),
      );
}
