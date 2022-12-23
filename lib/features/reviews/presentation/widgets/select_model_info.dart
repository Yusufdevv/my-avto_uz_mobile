import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectModelInfo extends StatelessWidget {
  const SelectModelInfo(
      {required this.title,
      required this.onTap,
      required this.color,
      required this.shadowColor,
      required this.blurRadius,
      required this.suffixIconPath,
      this.titleStyle,
      this.leading,
      this.suffixIconColor,
      this.verticalDivider,
      
      super.key});
  final String title;
  final TextStyle? titleStyle;
  final VoidCallback onTap;
  final Widget? leading;
  final Color? suffixIconColor;
  final String suffixIconPath;
  final Widget? verticalDivider;
  final Color color;
  final double blurRadius;
  final Color shadowColor;
  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: white.withOpacity(0.6)),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  offset: const Offset(0, 4),
                  blurRadius: blurRadius,
                  spreadRadius: 0,
                ),
              ]),
          height: 50,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.only(right: 13, left: 20),
          width: double.maxFinite,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ?? const SizedBox(),
              verticalDivider ?? const SizedBox(),
              Text(
                title,
                style: titleStyle ??
                    Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: white),
              ),
              const Spacer(),
              SvgPicture.asset(
                suffixIconPath,
                color: suffixIconColor,
                width: 24,
                height: 24,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      );
}
