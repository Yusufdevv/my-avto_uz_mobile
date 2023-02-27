import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeaelerInfoWidget extends StatelessWidget {
  final String icon;
  final String text;
  final bool? isTextBlue;
  final VoidCallback? onTap;
  const DeaelerInfoWidget({
    required this.icon,
    required this.text,
    this.onTap,
    this.isTextBlue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                text,
                style: isTextBlue == true
                    ? const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: blue)
                    : TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .midnightExpressToGreySuit),
              ),
            ),
          ),
        ],
      );
}
