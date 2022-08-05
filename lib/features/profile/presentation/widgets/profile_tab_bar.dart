import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/checkbox_style.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/profile/presentation/widgets/custom_tab.dart';
import 'package:flutter/material.dart';

class ProfileTabBar extends StatelessWidget {
  final TabController tabController;
  final ValueChanged<int> onTap;
  final List<String> tabs;
  final int currentTab;

  const ProfileTabBar(
      {required this.tabController,
      required this.onTap,
      this.currentTab = 0,
      this.tabs = const [],
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.91),
            color: const Color.fromRGBO(118, 118, 128, 0.24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: TabBar(
              indicatorWeight: 0,
              onTap: onTap,
              labelPadding: EdgeInsets.zero,
              indicator: BoxDecoration(
                color: Theme.of(context)
                    .extension<CheckBoxStyle>()!
                    .unselectedItemColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(6.93),
                ),
                border: Border.all(color: black.withOpacity(0.04)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.04),
                    blurRadius: 1,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              controller: tabController,
              labelStyle: Theme.of(context).textTheme.headline6,
              labelColor:
                  Theme.of(context).extension<ThemedColors>()!.blackToWhite,
              unselectedLabelColor:
                  Theme.of(context).extension<ThemedColors>()!.blackToWhite,
              tabs: List.generate(
                tabs.length,
                (index) => CustomTab(
                  title: tabs[index],
                  isLastItem: index == tabs.length - 1,
                ),
              ),
            ),
          ),
        ),
      );
}
