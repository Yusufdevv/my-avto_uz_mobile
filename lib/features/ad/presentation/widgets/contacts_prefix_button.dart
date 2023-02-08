// ignore_for_file: prefer_const_constructors

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactsPrefixButton extends StatelessWidget {
  const ContactsPrefixButton({
    required this.onTap,
    required this.isDisabled,
    required this.isLoading,
    required this.isSubmitted,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool isDisabled;
  final bool isLoading;
  final bool isSubmitted;

  @override
  Widget build(BuildContext context) {
    if (isSubmitted) {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: isSubmitted ? 50 : 12, vertical: 4),
        decoration: BoxDecoration(
            color: green.withOpacity(.18),
            borderRadius: BorderRadius.circular(8)),
        child: Center(child: SvgPicture.asset(AppIcons.checkRounded)),
      );
    }

    return WScaleAnimation(
      isDisabled: isDisabled,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
            color: isDisabled
                ? Theme.of(context)
                    .extension<ThemedColors>()!
                    .veryLightGreyToEclipse
                : orange,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: isLoading
              ? CupertinoActivityIndicator()
              : Text(
                  LocaleKeys.confirm.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: white),
                ),
        ),
      ),
    );
  }
}
