import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final String title;
  final TabController tabController;
  final String firstTab;
  final String secondTab;
  const CustomTabBar({required this.title, required this.tabController, required this.firstTab, required this.secondTab,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(color: greyText),),
      const SizedBox(height: 16,),
      Container(
        height: 32,
        margin:  const EdgeInsets.only(top: 10 ),
        decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.stormGrey12ToStormGrey24,
            borderRadius: BorderRadius.circular(9)),
        child: TabBar(

          controller: tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Theme.of(context).extension<ThemedColors>()!.whiteToSmoky,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 4.0,
                    offset: const Offset(0, 1)),
              ]),
          labelColor:  Theme.of(context).extension<ThemedColors>()!.blackToWhite,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          unselectedLabelColor: Theme.of(context).extension<ThemedColors>()!.blackToWhite,
          unselectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          tabs: [
            Tab(text: firstTab),
            Tab(text: secondTab),
          ],
        ),
      )
    ],
  );
}
