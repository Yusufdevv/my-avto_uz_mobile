
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/image_preload_shimmer.dart';
import 'package:flutter/material.dart';

class SearchItemShimmer extends StatelessWidget {
  final int slideImageCount;
  const SearchItemShimmer({
    required this.slideImageCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 12, left: 16, bottom: 12),
        decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            boxShadow: [
              BoxShadow(
                color: LightThemeColors.titleMedium.withOpacity(0.05),
                offset: const Offset(0, 4),
                blurRadius: 16,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 201,
              child: PageView.builder(
                pageSnapping: false,
                itemCount: slideImageCount,
                padEnds: false,
                clipBehavior: Clip.antiAlias,
                controller: PageController(viewportFraction: 0.65),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: ImagePreloadShimmer(
                    height: 201,
                    width: 264,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const ImagePreloadShimmer(height: 18, width: 154),
                ),
                const SizedBox(width: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const ImagePreloadShimmer(height: 18, width: 32),
                ),
              ],
            ),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const ImagePreloadShimmer(height: 23, width: 146),
            ),
            const SizedBox(height: 9),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const ImagePreloadShimmer(height: 14, width: 335),
            ),
            const SizedBox(height: 2),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const ImagePreloadShimmer(height: 14, width: 326),
            ),
            const SizedBox(height: 2),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const ImagePreloadShimmer(height: 14, width: 276),
            ),
            const SizedBox(height: 36),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: const ImagePreloadShimmer(height: 36, width: 36),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const ImagePreloadShimmer(height: 17, width: 102),
                    ),
                    const SizedBox(height: 2),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const ImagePreloadShimmer(height: 16, width: 79),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const ImagePreloadShimmer(height: 1),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const ImagePreloadShimmer(height: 16, width: 61),
                ),
                const SizedBox(width: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const ImagePreloadShimmer(height: 3, width: 3),
                ),
                const SizedBox(width: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const ImagePreloadShimmer(height: 16, width: 49),
                ),
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const ImagePreloadShimmer(height: 24, width: 24),
                ),
                const SizedBox(width: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const ImagePreloadShimmer(height: 24, width: 24),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
}
