import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class PtsButtons extends StatelessWidget {
  final String id;
  final Function(String) onTap;
  final bool isSelected;
  final String text;

  const PtsButtons(
      {required this.onTap,
      required this.id,
      this.isSelected = false,
      this.text = '',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: () {
          onTap(id);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(46),
              border: isSelected
                  ? Border.all(width: 1, color: purple)
                  : Border.all(width: 0, color: Colors.transparent),
              color: isSelected
                  ? Theme.of(context)
                      .extension<ThemedColors>()!
                      .lavenderToUltramarine30
                  : Theme.of(context)
                      .extension<ThemedColors>()!
                      .whiteSmokeToEclipse),
          child: Text(
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
        ),
      );
}
