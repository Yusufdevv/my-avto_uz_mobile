// ignore_for_file: prefer_expression_function_bodies

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegionCheckBox extends StatelessWidget {
  final bool isChecked;
  const RegionCheckBox({
    required this.isChecked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(2),
      alignment: Alignment.center,
      height: 20.28,
      width: 20.28,
      decoration: BoxDecoration(
        color: isChecked ? orange : null,
        border: isChecked ? null : Border.all(color: warmerGrey, width: 1.8),
        borderRadius: BorderRadius.circular(5.57),
      ),
      child: isChecked
          ? SvgPicture.asset(
              AppIcons.check,
              color: white,
              fit: BoxFit.contain,
            )
          : null,
    );
  }
}
