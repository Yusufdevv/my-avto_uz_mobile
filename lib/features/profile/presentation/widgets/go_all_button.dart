import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoAllButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final EdgeInsets padding;

  const GoAllButton(
      {required this.title,
      required this.onPressed,
      this.padding = const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: orange,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              onTap: onPressed,
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Text(
                    LocaleKeys.all.tr(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: greyText),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(AppIcons.chevronRightBlack, color: greyText)
                ],
              ),
            )
          ],
        ),
      );
}
