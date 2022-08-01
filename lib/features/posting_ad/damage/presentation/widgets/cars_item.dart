import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DamageCarsItem extends StatelessWidget {
  const DamageCarsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
      children: [
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppImages.carFromLeft),
              Positioned(
                left: 54,
                top: 27,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),
              Positioned(
                left: 115,
                bottom: 37,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),
              Positioned(
                right: 92,
                bottom: 37,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),
              Positioned(
                right: 37,
                top: 27,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),

            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppImages.carFromOpposite),
              Positioned(
                right: 54,
                left: 54,
                top: 3,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),
              Positioned(
                right: 54,
                left: 54,
                top: 30,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),
              Positioned(
                right: 54,
                left: 54,
                bottom: 16,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),

            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: Stack(
            children: [
              Image.asset(AppImages.carFromBack),
              Positioned(
                right: 50,
                left: 50,
                top: 24,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),
              Positioned(
                right: 50,
                left: 50,
                bottom: 16,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: Stack(
            children: [
              Image.asset(AppImages.carFromRight),
              Positioned(
                left: 39,
                top: 27,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),
              Positioned(
                left: 95,
                bottom: 39,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),
              Positioned(
                right: 116,
                bottom: 39,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),
              Positioned(
                right: 52,
                top: 27,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .whiteToGondola,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
}
