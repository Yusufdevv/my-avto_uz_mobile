// ignore_for_file: prefer_expression_function_bodies

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarkaChecked extends StatelessWidget {
  const MarkaChecked({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.4,
      child: SvgPicture.asset(
        AppIcons.check,
        color: orange,
        fit: BoxFit.contain,
      ),
    );
  }
}
