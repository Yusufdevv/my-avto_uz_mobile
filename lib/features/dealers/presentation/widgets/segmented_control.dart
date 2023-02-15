import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SegmentedControl extends SliverPersistentHeaderDelegate {
  SegmentedControl({required this.maxHeight, required this.minHeight});

  final double maxHeight;
  final double minHeight;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 24,
                  color: dark.withOpacity(0.08)),
              BoxShadow(
                  offset: const Offset(0, -1), color: dark.withOpacity(0.08))
            ]),
        child: Container(
          padding: const EdgeInsets.all(2),
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .whiteLilacToNightRider,
          ),
          child: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Theme.of(context).extension<ThemedColors>()!.whiteToSmoky,
            ),
            tabs: [
              Tab(
                child: Text(
                  LocaleKeys.list.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 13),
                ),
              ),
              Tab(
                child: Text(
                  LocaleKeys.on_map.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
