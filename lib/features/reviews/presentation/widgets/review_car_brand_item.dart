import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
//import 'package:auto/features/reviews/domain/entities/brand_entity.dart';
import 'package:flutter/material.dart';

class ReviewCarBrandItem extends StatelessWidget {
  //final BrandEntity carBrandEntity;
  final bool hasShadow;

  const ReviewCarBrandItem({this.hasShadow = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 100,
        width: 80,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            border: Border.all(
                width: 1,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeToDarkRider),
            boxShadow: [
              if (hasShadow)
                BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 19,
                    color: dark.withOpacity(0.07))
              else
                const BoxShadow()
            ]),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Image.asset(
            //   carBrandEntity.icon,
            //   width: 40,
            //   height: 40,
            // ),
            // const SizedBox(height: 8),
            // Text(
            //   carBrandEntity.title,
            //   textAlign: TextAlign.center,
            //   maxLines: 2,
            //   style: Theme.of(context)
            //       .textTheme
            //       .displayLarge!
            //       .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
            // )
          ],
        ),
      );
}
