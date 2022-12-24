import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  CustomChip(
      {required this.label,
      this.labelPadding,
      this.labelColor,
      this.labelSize,
      this.labelStyle,
      this.height,
      this.width,
      this.leading,
      this.leadingPadding,
      this.trailing,
      this.trailingPadding,
      this.trailingFunction,
      this.backgroundColor,
      this.gradient,
      this.borderRadius,
      this.border,
      this.margin,
      Key? key})
      : super(key: key);
  String label;
  EdgeInsets? labelPadding;
  TextStyle? labelStyle;
  Color? labelColor;
  double? labelSize;
  double? height;
  double? width;
  Widget? leading;
  EdgeInsets? leadingPadding;
  Widget? trailing;
  EdgeInsets? trailingPadding;
  dynamic trailingFunction;
  Color? backgroundColor;
  Gradient? gradient;
  double? borderRadius;
  Border? border;
  EdgeInsets? margin;

  @override
  Widget build(BuildContext context) => FittedBox(
        child: Container(
          height: height,
          width: width,
          margin: margin ?? EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 18),
            border: border,
            color: gradient == null
                ? (backgroundColor ??
                    Theme.of(context)
                        .extension<ThemedColors>()!
                        .greySuitToWhite)
                : null,
            gradient: gradient,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Padding(
                padding: leading == null
                    ? EdgeInsets.zero
                    : (leadingPadding ?? const EdgeInsets.only(left: 4)),
                child: leading ?? const SizedBox(),
              ),
              Padding(
                padding:
                    labelPadding ?? const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  label,
                  style: labelStyle ??
                      TextStyle(
                        fontSize: labelSize ?? 15,
                        color: labelColor ??
                            Theme.of(context)
                                .extension<ThemedColors>()!
                                .darkToWhite,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              GestureDetector(
                onTap: trailingFunction ?? () {},
                child: Padding(
                  padding: trailing == null
                      ? EdgeInsets.zero
                      : (trailingPadding ?? const EdgeInsets.only(right: 4)),
                  child: trailing ?? const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      );
}
