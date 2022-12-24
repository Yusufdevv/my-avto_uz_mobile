import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class CommercialCarModelItem extends StatelessWidget {
  CommercialCarModelItem(
      {required this.title,
      this.centerTitle = false,
      this.subtitle,
      super.key});
  bool centerTitle;
  String title;
  String? subtitle;
  TextStyle? titleStyle;
  TextStyle? subtitleStyle;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: theme.whiteToDark,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: theme.dividerColorToGrey)),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
            Text(subtitle ?? '',
                style: subtitleStyle ??
                    Theme.of(context).textTheme.caption!.copyWith(color: grey))
          ],
        ),
      ),
    );
  }
}
