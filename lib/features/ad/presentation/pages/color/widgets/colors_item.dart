import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class ColorsItem extends StatelessWidget {
  final Color color;
  final String colorName;
  final VoidCallback onTap;
  final bool isSelected;

  const ColorsItem(
      {required this.color,
      required this.onTap,
      required this.colorName,
      this.isSelected = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: isSelected
                  ? purple
                  : Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitudeToDarkRider,
            ),
            color: isSelected
                ? Theme.of(context)
                    .extension<ThemedColors>()!
                    .lavenderToMediumSlateBlue30
                : Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: color,
                    border: Border.all(
                        width: 1,
                        color: colorName == 'Черный'
                            ? Theme.of(context)
                                .extension<ThemedColors>()!
                                .solitudeToBastille
                            : dividerColor)),
                width: double.infinity,
                height: 54,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                colorName,
                style: isSelected
                    ? Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 14)
                    : Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: grey),
              )
            ],
          ),
        ),
      );
}
