import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ads/presentation/widgets/filters_buttons_widget.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_car_model_item.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_tab.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
import 'package:auto/features/comparison/presentation/pages/choose_model.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsSliverWidget extends SliverPersistentHeaderDelegate {
  AdsSliverWidget(
      {required this.size, required this.theme, required this.tabController});
  final Size size;
  final ThemedColors theme;
  final TabController tabController;

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
          const SizedBox(height: 16),
          CommercialCarModelItem(
              title: context.read<GetMakesBloc>().state.name,
              subtitle: context.read<GetCarModelBloc>().state.name,
              imageUrl: context.read<GetMakesBloc>().state.imageUrl,
              onTap: () {
                Navigator.push(
                    context,
                    fade(
                        page: ChooseCarBrandComparison(
                            isClear: false,
                            onTap: () => Navigator.of(context)
                                    .push(fade(
                                        page: ChooseCarModelComparison(
                                            isClear: false,
                                            onTap: () {
                                              context
                                                  .read<AnnouncementListBloc>()
                                                  .add(AnnouncementListEvent
                                                      .getFilter(
                                                    context
                                                        .read<
                                                            AnnouncementListBloc>()
                                                        .state
                                                        .filter
                                                        .copyWith(
                                                            make: context
                                                                .read<
                                                                    GetMakesBloc>()
                                                                .state
                                                                .selectId,
                                                            model: context
                                                                .read<
                                                                    GetCarModelBloc>()
                                                                .state
                                                                .selectedId),
                                                  ));
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            })))
                                    .then((value) {
                                  context.read<AnnouncementListBloc>().add(
                                      AnnouncementListEvent.getIsHistory(context
                                              .read<GetMakesBloc>()
                                              .state
                                              .selectId <=
                                          0));
                                  context.read<AnnouncementListBloc>().add(
                                      AnnouncementListEvent
                                          .getAnnouncementList());
                                }))));
              }),
          const SizedBox(height: 12),
          FilterButtonsWidget(size: size, theme: theme),
          const SizedBox(height: 16),
        ],
      );

  @override
  double get maxExtent => 180;

  @override
  double get minExtent => 180;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
