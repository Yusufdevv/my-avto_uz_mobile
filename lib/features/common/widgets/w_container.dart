import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class WContainer extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final EdgeInsets? titlePadding;
  final double? width;
  final double? height;
  final BoxBorder? border;
  final double? borderRadius;
  final String? label;
  final TextStyle? labelStyle;
  final EdgeInsets? labelPadding;
  final Color? color;
  final String title;
  final TextStyle? titleStyle;
  final String? hint;
  final TextStyle? hintStyle;
  final String leadingIcon;
  final String trailingIcon;
  final EdgeInsets contentPadding;
  final bool isTitleCentered;
  final bool isLabelCentered;
  final Function() onTap;
  const WContainer({
    required this.onTap,
    this.isLabelCentered = false,
    this.isTitleCentered = false,
    this.contentPadding = const EdgeInsets.all(12),
    this.width,
    this.height,
    this.title = '',
    this.trailingIcon = '',
    this.leadingIcon = '',
    this.border,
    this.borderRadius,
    this.color,
    this.titleStyle,
    this.hint,
    this.hintStyle,
    this.label,
    this.labelStyle,
    this.labelPadding,
    this.margin,
    this.padding,
    this.titlePadding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: margin,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null)
            Padding(
              padding: labelPadding ?? EdgeInsets.zero,
              child: Align(
                alignment:
                isLabelCentered ? Alignment.center : Alignment.centerLeft,
                child: Text(
                  label!,
                  style: labelStyle ??
                      Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          WScaleAnimation(
            scaleValue: 0.9999,
            onTap: onTap,
            child: Container(
              padding: contentPadding,
              width: width ?? double.maxFinite,
              height: height,
              decoration: BoxDecoration(
                color: color ?? Theme.of(context).extension<ThemedColors>()!.solitudeContainerToDark,
                border: border,
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (leadingIcon.isNotEmpty) SvgPicture.asset(leadingIcon),
                  if (title.isNotEmpty)
                    Expanded(
                      child: Padding(
                        padding: titlePadding ?? EdgeInsets.zero,
                        child: Text(
                          title,
                          style: titleStyle ??
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: warmerGrey
                              ),
                          textAlign: isTitleCentered
                              ? TextAlign.center
                              : TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  else
                    Text(
                      hint ?? '',
                      style: hintStyle ??
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  if (trailingIcon.isNotEmpty) SvgPicture.asset(trailingIcon),
                ],
              ),
            ),
          ),
        ],
      ),
    );
}
