import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BrandShimmerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: 72,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
          border: Border.all(color: border, width: 1),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 19,
              spreadRadius: 0,
              color: dark.withOpacity(0.07),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 14,
              child: Shimmer.fromColors(
                baseColor: grey.withOpacity(0.15),
                highlightColor: grey.withOpacity(0.26),
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 28,
              left: 8,
              right: 8,
              child: Shimmer.fromColors(
                baseColor: grey.withOpacity(0.5),
                highlightColor: grey.withOpacity(0.16),
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 8,
              right: 8,
              child: Shimmer.fromColors(
                baseColor: grey.withOpacity(0.5),
                highlightColor: grey.withOpacity(0.16),
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
