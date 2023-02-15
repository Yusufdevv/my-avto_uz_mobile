import 'package:flutter/material.dart';

class PersistentHeaderSearch extends SliverPersistentHeaderDelegate {
  final Widget child;

  PersistentHeaderSearch({required this.child});
  @override
  double get minExtent => 80;

  @override
  double get maxExtent => 84;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      child;
}
