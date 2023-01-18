import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WFilterButton extends StatelessWidget {
  const WFilterButton({
    Key? key,
    required this.size,
    required this.theme,
    required this.icon,
    required this.name,
    required this.claerA,
    required this.defaultTitle,
    required this.activeColor,
    required this.onTap,
    required this.onTapClear,
  }) : super(key: key);

  final Size size;
  final ThemedColors theme;
  final String icon;
  final String name;
  final bool claerA;
  final String defaultTitle;
  final Color activeColor;
  final VoidCallback onTap;
  final VoidCallback onTapClear;

  @override
  Widget build(BuildContext context) => WButton(
        onTap: onTap,
        width: size.width * 0.45,
        borderRadius: 8,
        padding: const EdgeInsets.all(12),
        border: Border.all(color: theme.dividerColorToGrey),
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: claerA ? activeColor : dark,
              height: 16,
              width: 16,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: size.width * 0.22,
              child: Text(
                name.isEmpty ? defaultTitle : name,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: claerA ? activeColor : null),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            if (claerA)
              CircleAvatar(
                backgroundColor: warmerGrey,
                radius: 10,
                child: InkWell(
                  onTap: onTapClear,
                  child: SvgPicture.asset(
                    AppIcons.close,
                    color: white,
                    fit: BoxFit.cover,
                    height: 14,
                    width: 14,
                  ),
                ),
              )
          ],
        ),
      );
}
