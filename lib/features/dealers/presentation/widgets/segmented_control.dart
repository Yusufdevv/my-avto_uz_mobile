import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SegmentedControl extends SliverPersistentHeaderDelegate {
  SegmentedControl(
      {required this.maxHeight,
      required this.minHeight,
      required this.boolean,
      required this.pageController});
  final ValueChanged<bool> boolean;
  final double maxHeight;
  final double minHeight;
  final PageController pageController;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);
    return Container(
      color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
      padding: const EdgeInsets.all(16),
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
            onTap: (integer) {
              pageController.animateToPage(integer,
                  duration: const Duration(milliseconds: 50),
                  curve: Curves.linear);
              if (integer == 1) {
                boolean(true);
              } else if (integer == 0) {
                boolean(false);
              }
            },
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Theme.of(context).extension<ThemedColors>()!.whiteToSmoky,
            ),
            tabs: [
              Tab(
                child: Text(
                  'Списком',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 13),
                ),
              ),
              Tab(
                child: Text(
                  'На карте',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 13),
                ),
              )
            ]),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
