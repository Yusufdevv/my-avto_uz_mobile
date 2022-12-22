import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarBrandContainer extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool hasShadow;

  const CarBrandContainer(
      {this.hasShadow = false,
      Key? key,
      required this.title,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 100,
        width: 80,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
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
                color: dark.withOpacity(0.07),
              )
            else
              const BoxShadow()
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            if (imageUrl.isEmpty)
              SvgPicture.asset(
                AppImages.carImage,
                height: 40,
                fit: BoxFit.cover,
              )
            else
              Image.network(
                imageUrl,
                height: 40,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
            )
          ],
        ),
      );
}
