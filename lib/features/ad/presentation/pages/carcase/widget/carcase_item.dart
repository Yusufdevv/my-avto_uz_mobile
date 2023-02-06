import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class BodyTypeItem extends StatelessWidget {
  final String title;
  final String image;
  final bool selected;
  const BodyTypeItem(
      {required this.title,
      required this.image,
      required this.selected,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context)
              .extension<ThemedColors>()!
              .mediumSlateBlue50ToNightRider,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          children: [
            if (image.isEmpty) ...{
              Image.asset(AppImages.carcase),
            } else ...{
              CachedImage(
                fit: BoxFit.cover,
                imageUrl: image,
                borderRadius: BorderRadius.circular(8),
              ),
            },
            const SizedBox(width: 12),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.all(2.2),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: selected ? purple : grey, width: 1.9),
                  shape: BoxShape.circle),
              child: selected
                  ? Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: purple),
                    )
                  : null,
            )
          ],
        ),
      );
}
