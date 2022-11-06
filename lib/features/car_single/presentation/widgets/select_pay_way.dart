import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/car_single/presentation/widgets/w_container_style.dart';
import 'package:auto/features/car_single/presentation/widgets/w_radio.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectGenderItem extends StatelessWidget {
  final int value;
  final int groupValue;
  final Color borderColor;
  final Color color;
  final VoidCallback onTap;
  final String iconPath;

  const SelectGenderItem({
    Key? key,
    required this.value,
    required this.color,
    required this.groupValue,
    required this.borderColor,
    required this.onTap,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          height: 44,
          width: 22,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: 1,
                color: borderColor ??
                    Theme.of(context)
                        .extension<WContainerStyle>()!
                        .borderColor),
          ),
          child: Row(
            children: [
              WRadio(
                onChanged: (v) {},
                value: value,
                groupValue: groupValue,
                activeColor: purple,
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(iconPath),
            ],
          ),
        ),
      );
}
