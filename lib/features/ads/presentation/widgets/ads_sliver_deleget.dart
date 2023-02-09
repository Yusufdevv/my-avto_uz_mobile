import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ads/presentation/widgets/filters_buttons_widget.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_car_model_item.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_tab.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
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
          CommercialCarModelItem(
              title: context.read<GetMakesBloc>().state.name,
              subtitle: context.read<GetCarModelBloc>().state.name,
              imageUrl: context.read<GetMakesBloc>().state.imageUrl,
              onTap: () {
                Navigator.push(context,
                    fade(page: const ChooseCarBrandComparison(isClear: false)));
              }),
          FilterButtonsWidget(size: size, theme: theme),
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
