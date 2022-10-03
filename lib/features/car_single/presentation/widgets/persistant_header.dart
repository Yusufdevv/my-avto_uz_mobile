import 'package:auto/features/car_single/presentation/parts/description_tabs.dart';
import 'package:flutter/material.dart';


class DescriptionHeader extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 40;

  @override
  double get maxExtent => 44;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) =>  const DescriptionTabs();
}

