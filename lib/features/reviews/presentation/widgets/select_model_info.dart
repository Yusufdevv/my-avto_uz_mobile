import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';

class SelectModelInfo extends StatelessWidget {
  const SelectModelInfo(
      {required this.title,
      required this.onTap,
      this.centerTitle = false,
      this.subtitle,
      this.titleStyle,
      this.subtitleStyle,
      super.key});
  final bool centerTitle;
  final String title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: theme.whiteToDark,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: theme.dividerColorToGrey)),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(
            vertical: subtitle != null ? 8 : 18, horizontal: 12),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: centerTitle
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Text(title,
                style: titleStyle ??
                    Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: theme.darkToWhite)),
            if (subtitle == null)
              const SizedBox()
            else
              Text(subtitle!,
                  style: subtitleStyle ??
                      Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: grey))
          ],
        ),
      ),
    );
  }
}
