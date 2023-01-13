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
        height: MediaQuery.of(context).size.height * 0.331,
        width: MediaQuery.of(context).size.width * 0.6,
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
                child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.155,
              width: MediaQuery.of(context).size.width * 0.6,
              child: const ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                   ),
            ),
                ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Shimmer.fromColors(
                baseColor: grey.withOpacity(0.5),
                highlightColor: grey.withOpacity(0.16),
                child: Container(
                  height: 8,
                  width: MediaQuery.of(context).size.width *0.229 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                  ),
                ),
              ),
            ),
             const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Shimmer.fromColors(
                baseColor: grey.withOpacity(0.5),
                highlightColor: grey.withOpacity(0.16),
                child: Container(
                  height: 12,
                  width:MediaQuery.of(context).size.width * 0.336,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                  ),
                ),
              ),
            ),
             const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Shimmer.fromColors(
                baseColor: grey.withOpacity(0.5),
                highlightColor: grey.withOpacity(0.16),
                child: Container(
                  height: 8,
                  width:MediaQuery.of(context).size.width * 0.336,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Shimmer.fromColors(
                baseColor: grey.withOpacity(0.5),
                highlightColor: grey.withOpacity(0.16),
                child: Container(
                  height: 8,
                  width:MediaQuery.of(context).size.width * 0.229,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                  ),
                ),
              ),
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
              padding: const EdgeInsets.only(right: 12, left: 16, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.location),
                        const SizedBox(width: 4),
                        Shimmer.fromColors(
                          baseColor: grey.withOpacity(0.5),
                          highlightColor: grey.withOpacity(0.16),
                          child: Container(
                            height: 6,
                            width: MediaQuery.of(context).size.width *0.168 ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AddWishlistItem(
                    onTap:(){},
                    initialLike: false,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
