import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final String title;
  final TabController tabController;
  final String firstTab;
  final String secondTab;

  const CustomTabBar(
      {required this.title,
      required this.tabController,
      required this.firstTab,
      required this.secondTab,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: greyText),
            ),
            Container(
              height: 32,
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .stormGrey12ToStormGrey24,
                  borderRadius: BorderRadius.circular(9)),
              child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                    border: Border.all(
                        width: .5, color: darkBlack.withOpacity(.04)),
                    borderRadius: BorderRadius.circular(7),
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToSmoky,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 4,
                          offset: const Offset(0, 1)),
                    ]),
                labelColor: LightThemeColors.midnightExpressToWhite,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                unselectedLabelColor:
                    Theme.of(context).extension<ThemedColors>()!.blackToWhite,
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                tabs: [
                  Tab(text: firstTab),
                  Tab(text: secondTab),
                ],
              ),
            )
          ],
        ),
      );
}
