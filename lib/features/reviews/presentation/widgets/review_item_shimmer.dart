import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/image_preload_shimmer.dart';
import 'package:flutter/material.dart';

class ReviewItemShimmer extends StatelessWidget {
  const ReviewItemShimmer({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: double.maxFinite,
        color: white,
        padding:
            const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: const ImagePreloadShimmer(height: 200),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImagePreloadShimmer(
                    height: 17,
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImagePreloadShimmer(
                    height: 17,
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ImagePreloadShimmer(
                height: 20,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: const ImagePreloadShimmer(height: 16),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ImagePreloadShimmer(
                height: 16,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            const SizedBox(height: 29),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImagePreloadShimmer(
                    height: 16,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImagePreloadShimmer(
                    height: 17,
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
