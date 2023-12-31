import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/main/presentation/parts/top_brands.dart';
import 'package:flutter/material.dart';

class TopBrandSliverWidget extends SliverPersistentHeaderDelegate {
  final ValueChanged<MakeEntity> onTap;

  TopBrandSliverWidget({
    required this.onTap,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) =>
      Column(
        children: [
          TopBrands(
            onTap: onTap,
            isText: false,
          ),
          Transform.translate(
            offset: const Offset(0, 1),
            child: Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      );

  @override
  double get maxExtent => 152;

  @override
  double get minExtent => 152;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
