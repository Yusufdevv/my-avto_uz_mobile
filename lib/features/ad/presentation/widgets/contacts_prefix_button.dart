import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
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

    return WButton(
      isLoading: isLoading,
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
          child: Text(
            'Подтвердить',
            style:
                Theme.of(context).textTheme.subtitle1!.copyWith(color: white),
          ),
        ),
      ),
    );
  }
}
