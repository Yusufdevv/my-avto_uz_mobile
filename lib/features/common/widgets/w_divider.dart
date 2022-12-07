import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class WDivider extends StatelessWidget {
  final EdgeInsets? margin;
  final Color? color;

  const WDivider({this.margin, this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 1,
        width: double.infinity,
        margin: margin ?? EdgeInsets.zero,
        color:
            color ?? Theme.of(context).extension<ThemedColors>()!.dividerColor,
      );
}
