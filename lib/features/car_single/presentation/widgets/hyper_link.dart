import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Hyperlink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final Color? textColor;
  final String? prefixIcon;

  const Hyperlink({
    required this.text,
    required this.onTap,
    this.textStyle,
    this.textColor,
    this.prefixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            children: [
              if (prefixIcon != null)
                WidgetSpan(
                  child: SvgPicture.asset(prefixIcon!),
                ),
              const WidgetSpan(child: SizedBox(width: 4)),
              TextSpan(
                text: text,
                style: textStyle ??
                    Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 13,
                          color: textColor ?? black,
                        ),
              ),
            ],
          ),
        ),
      );
}
