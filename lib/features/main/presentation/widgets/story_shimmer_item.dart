import 'package:auto/assets/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StoryShimmerItem extends StatelessWidget {
  const StoryShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: dividerColor),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 19,
              spreadRadius: 0,
              color: dark.withOpacity(0.04),
            ),
          ],
        ),
        child: Stack(
          children: [
            Shimmer(
              enabled: true,
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  grey.withOpacity(0.15),
                  grey.withOpacity(0.26),
                  grey.withOpacity(0),
                ],
                stops: const [
                  0.2,
                  0.3,
                  0.4,
                ],
              ),
              child: Container(
                height: 88,
                width: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: white,
                ),
              ),
            ),
            Positioned(
              left: 4,
              right: 16,
              bottom: 16,
              child: Shimmer(
                enabled: true,
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    grey.withOpacity(0.50),
                    grey.withOpacity(0.16),
                  ],
                  stops: const [
                    0.2,
                    0.3,
                  ],
                ),
                child: Container(
                  height: 8,
                  width: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: grey,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 4,
              right: 16,
              bottom: 4,
              child: Shimmer(
                enabled: true,
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    grey.withOpacity(0.50),
                    grey.withOpacity(0.16),
                  ],
                  stops: const [
                    0.2,
                    0.3,
                  ],
                ),
                child: Container(
                  height: 8,
                  width: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
