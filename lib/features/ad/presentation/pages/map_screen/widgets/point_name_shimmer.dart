import 'package:auto/assets/colors/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

class PointNameShimmer extends StatelessWidget {
  const PointNameShimmer({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: grey.withOpacity(0.5),
              highlightColor: grey.withOpacity(0.16),
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Shimmer.fromColors(
              baseColor: grey.withOpacity(0.5),
              highlightColor: grey.withOpacity(0.16),
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      );
}
