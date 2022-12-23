import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class ReviewTabBar extends StatelessWidget {
  const ReviewTabBar(
      {required this.tabController,
      required this.tabLabels,
      this.indicatorColor,
      this.backgroundColor,
      this.selectedTextColor,
      this.unSelectedColor,
      super.key});
  final TabController tabController;
  final List<String> tabLabels;
  final Color? indicatorColor;
  final Color? backgroundColor;
  final Color? selectedTextColor;
  final Color? unSelectedColor;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 24,
                color: dark.withOpacity(.08),
              )
            ]),
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: backgroundColor ?? stormGrey12,
          ),
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: TabBar(
            controller: tabController,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: indicatorColor ??
                    Theme.of(context).extension<ThemedColors>()!.whiteToDolphin,
                boxShadow: [
                  BoxShadow(
                      color: black.withOpacity(0.04),
                      blurRadius: 1,
                      offset: const Offset(0, 3)),
                  BoxShadow(
                      color: black.withOpacity(0.12),
                      blurRadius: 8,
                      offset: const Offset(0, 3)),
                ]),
            labelPadding: EdgeInsets.zero,
            labelColor: selectedTextColor ??
                Theme.of(context).extension<ThemedColors>()!.blackToWhite,
            unselectedLabelStyle:
                Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
            unselectedLabelColor: unSelectedColor ??
                Theme.of(context).extension<ThemedColors>()!.blackToWhite,
            labelStyle:
                Theme.of(context).textTheme.subtitle1,
            tabs: [
              for (int i = 0; i < tabLabels.length - 1; i++)
                Row(
                  children: [
                    Expanded(child: Tab(text: tabLabels[i])),
                    VerticalDivider(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .veryLightGreyToEclipse,
                      thickness: 0.65,
                      width: 0.65,
                      indent: 5,
                      endIndent: 2,
                    )
                  ],
                ),
              Tab(text: tabLabels.last),
            ],
          ),
        ),
      );
}
