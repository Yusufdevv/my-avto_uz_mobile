import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DescriptionHeader extends SliverPersistentHeaderDelegate {
  final TabController controller;
  final ValueChanged onTap;

  const DescriptionHeader({
    required this.controller,
    required this.onTap,
  });

  @override
  double get minExtent => 68;

  @override
  double get maxExtent => 68;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      AnimatedContainer(
        duration: const Duration(milliseconds: 80),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: shrinkOffset > 1 ? border : border)),
          boxShadow: shrinkOffset > 1
              ? [
                  BoxShadow(
                    offset: const Offset(0, -1),
                    blurRadius: 0,
                    color: dark.withOpacity(0.08),
                  ),
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 24,
                    color: dark.withOpacity(0.08),
                  ),
                ]
              : [],
          color: shrinkOffset > 0
              ? white
              : const Color(
                  0xffFAFAFB,
                ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffE5E5E5),
          ),
          child: TabBar(
            controller: controller,
            onTap: onTap,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            indicator: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                  color: black.withOpacity(0.12),
                ),
              ],
              borderRadius: BorderRadius.circular(
                8,
              ),
              color: Theme.of(context).extension<ThemedColors>()!.whiteToSmoky,
            ),
            labelPadding: const EdgeInsets.symmetric(vertical: 6),
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
            labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
            labelColor:
                Theme.of(context).extension<ThemedColors>()!.darkToWhite,
            tabs: [
              Tab(
                child: Text(
                  LocaleKeys.description.tr(),
                ),
              ),
              Tab(child: Text(LocaleKeys.characteristic.tr())),
            ],
          ),
        ),
      );
}
