import 'package:flutter/material.dart';

class SegmentedControl extends SliverPersistentHeaderDelegate {
  SegmentedControl({required this.maxHeight, required this.minHeight});
  final maxHeight;
  final minHeight;
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Container(
        padding: const EdgeInsets.all(2),
        height: 32,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.lightGreen,
        ),
        child: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.blue,
            ),
            tabs: const [
              Tab(
                text: 'List',
              ),
              Tab(
                text: 'Map',
              )
            ]),
      );

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
