import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final Color? color;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? tabBarMargin;
  final double? height;

  const SliverTabBarDelegate({
    this.color = white,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.tabBarMargin,
    this.height,
  });

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        color: Colors.white,
        padding:
            padding ?? const EdgeInsets.only(bottom: 12, left: 16, right: 16),
        child: Container(
          height: height ?? 200,
          margin: tabBarMargin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: color,
          ),
          child: child,
        ),
      );

  @override
  double get maxExtent => height ?? 200;

  @override
  double get minExtent => height ?? 200;
}
