import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MarksWithAnnouncements extends StatelessWidget {
  final String mark;
  final int quantity;
  final String imageUrl;
  const MarksWithAnnouncements({
    required this.mark,
    required this.quantity,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 96,
              height: 64,
              decoration: BoxDecoration(
                border: Border.all(color: solitude),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  errorWidget: (context, url, error) =>
                      Image.asset(AppImages.autoUz),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  mark,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .midnightExpressToGreySuit),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '($quantity)',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
