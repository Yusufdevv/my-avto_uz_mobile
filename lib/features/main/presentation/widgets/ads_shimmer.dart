import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/search/presentation/widgets/add_wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class AdsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: 225,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: white,
          border: Border.all(color: border, width: 1),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 19,
              spreadRadius: 0,
              color: dark.withOpacity(0.04),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: grey.withOpacity(0.15),
              highlightColor: grey.withOpacity(0.26),
              child: const SizedBox(
                  height: 126,
                  width: 225,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12)))),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Shimmer.fromColors(
                  baseColor: grey.withOpacity(0.5),
                  highlightColor: grey.withOpacity(0.16),
                  child: Container(
                      height: 8,
                      width: 86,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white))),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Shimmer.fromColors(
                  baseColor: grey.withOpacity(0.5),
                  highlightColor: grey.withOpacity(0.16),
                  child: Container(
                      height: 12,
                      width: 126,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white))),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Shimmer.fromColors(
                  baseColor: grey.withOpacity(0.5),
                  highlightColor: grey.withOpacity(0.16),
                  child: Container(
                      height: 8,
                      width: 193,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white))),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Shimmer.fromColors(
                  baseColor: grey.withOpacity(0.5),
                  highlightColor: grey.withOpacity(0.16),
                  child: Container(
                      height: 8,
                      width: 193,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white))),
            ),
            const SizedBox(height: 18),
            Container(
              height: 1,
              margin: const EdgeInsets.only(left: 16),
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToWhite35,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.location),
                      const SizedBox(width: 4),
                      Shimmer.fromColors(
                          baseColor: grey.withOpacity(0.5),
                          highlightColor: grey.withOpacity(0.16),
                          child: Container(
                              height: 6,
                              width: MediaQuery.of(context).size.width * 0.168,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: white))),
                    ],
                  ),
                  AddWishlistItem(
                    onTap: () {},
                    initialLike: false,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
