import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';

class SocialMediaItem extends StatelessWidget {
  final Widget icon;
  final Color? backgroundColor;
  final Color? borderColor;
  const SocialMediaItem({required this.icon, this.borderColor, this.backgroundColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    width: 40,
    height: 40,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: backgroundColor ?? Theme.of(context).extension<ThemedColors>()!.whiteToWhiteOpacity20,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        width: 1,
        color: borderColor ?? Theme.of(context).extension<ThemedColors>()!.dividerColorToGrey,
      )
    ),
    child: icon,
  );
}
