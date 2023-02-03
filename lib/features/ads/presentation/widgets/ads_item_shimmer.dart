import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AdsShimmerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 454,
        padding: const EdgeInsets.only(top: 12, left: 16, bottom: 12),
        color: white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 201,
              child: PageView.builder(
                itemCount: 2,
                itemBuilder: (context, index) => Shimmer.fromColors(
                  baseColor: grey.withOpacity(0.5),
                  highlightColor: grey.withOpacity(0.16),
                  child: Container(
                    height: 201,
                    width: 280,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Shimmer.fromColors(
              baseColor: grey.withOpacity(0.5),
              highlightColor: grey.withOpacity(0.16),
              child: Container(
                  height: 20,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: white)),
            ),
            const SizedBox(height: 4),
            Shimmer.fromColors(
              baseColor: grey.withOpacity(0.5),
              highlightColor: grey.withOpacity(0.16),
              child: Container(
                  height: 24,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: white)),
            ),
            const SizedBox(height: 8),
            Shimmer.fromColors(
              baseColor: grey.withOpacity(0.5),
              highlightColor: grey.withOpacity(0.16),
              child: Container(
                  height: 36,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: white)),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: grey.withOpacity(0.5),
                  highlightColor: grey.withOpacity(0.16),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50), color: white),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: grey.withOpacity(0.5),
                      highlightColor: grey.withOpacity(0.16),
                      child: Container(
                          height: 17,
                          width: 102,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: white)),
                    ),
                    const SizedBox(height: 4),
                    Shimmer.fromColors(
                      baseColor: grey.withOpacity(0.5),
                      highlightColor: grey.withOpacity(0.16),
                      child: Container(
                          height: 16,
                          width: 79,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: white)),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitude2ToNightRider,
              height: 28,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: grey.withOpacity(0.5),
                    highlightColor: grey.withOpacity(0.16),
                    child: Container(
                        height: 16,
                        width: 121,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: white)),
                  ),
                  const Spacer(),
                  Shimmer.fromColors(
                    baseColor: grey.withOpacity(0.5),
                    highlightColor: grey.withOpacity(0.16),
                    child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: white)),
                  ),
                  Container(width: 8),
                  Shimmer.fromColors(
                    baseColor: grey.withOpacity(0.5),
                    highlightColor: grey.withOpacity(0.16),
                    child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: white)),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
