import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterCheckboxedButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String text;

  const FilterCheckboxedButton(
      {required this.onTap, this.isSelected = false, this.text = '', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(

          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(46),
              border: Border.all(
                  width: 1, color: isSelected ? purple : dividerColor),
              color: isSelected
                  ? Theme.of(context)
                      .extension<ThemedColors>()!
                      .lavenderToUltramarine30
                  : Theme.of(context)
                      .extension<ThemedColors>()!
                      .whiteSmokeToEclipse),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 6),
                padding: const EdgeInsets.all(3),
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                  border: isSelected
                      ? null
                      : Border.all(color: warmerGrey, width: 1.5),
                  color: isSelected
                      ? Theme.of(context)
                          .extension<ThemedColors>()!
                          .mediumSlateBlueToDolphin
                      : null,
                  borderRadius: BorderRadius.circular(4.65),
                ),
                child: isSelected
                    ? SvgPicture.asset(
                        AppIcons.check,
                        color: Colors.white,
                      )
                    : null,
              ),
              Text(
                text,
                style: isSelected
                    ? Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600)
                    : Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: greyText),
              ),
            ],
          ),
        ),
      );
}
