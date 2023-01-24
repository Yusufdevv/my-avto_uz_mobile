import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/sliver_tabbar_delegate.dart';
import 'package:flutter/material.dart';

class WSliverTabBar extends StatelessWidget {
  final TabController tabController;
  final Function(int)? onTap;
  final List<Widget> tabs;
  final double? height;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final EdgeInsets? tabBarMargin;
  final String leftText;
  final String centerText;
  final String rightText;

  const WSliverTabBar({
    required this.tabController,
    required this.tabs,
    this.padding,
    this.backgroundColor,
    this.tabBarMargin,
    this.height,
    this.onTap,
    Key? key,
    this.leftText = 'LocaleKeys.all',
    this.centerText = 'LocaleKeys.using',
    this.rightText = 'LocaleKeys.close',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverPersistentHeader(
        pinned: true,
        delegate: SliverTabBarDelegate(
          height: height,
          padding: padding,
          backgroundColor: backgroundColor,
          tabBarMargin: tabBarMargin,
          // color: const Color.fromRGBO(51, 51, 51, 0.03),
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(118, 118, 128, 0.12),
              borderRadius: BorderRadius.circular(8.91),
            ),
            padding: const EdgeInsets.all(2),
            child: TabBar(
              controller: tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(6.93),
                color: Colors.white,
                border: Border.all(color: black.withOpacity(0.04)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              labelColor: black,
              labelStyle: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
              unselectedLabelColor: black,
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
              tabs: [
                Tab(text: leftText),
                Tab(text: centerText),
                Tab(text: rightText),
              ],
            ),
          ),
        ),
      );
}
