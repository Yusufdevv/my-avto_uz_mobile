import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SheetHeader extends StatelessWidget {
  final String title;
  final VoidCallback onCancelPressed;
  const SheetHeader({
    required this.title,
    required this.onCancelPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding:
            const EdgeInsets.only(bottom: 26, left: 16, top: 20, right: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .darkToWhite,
                fontWeight: FontWeight.w700,
              ),
            ),
            WScaleAnimation(
              onTap: onCancelPressed,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: SvgPicture.asset(AppIcons.cancel, color: greyText),
              ),
            ),
          ],
        ),
      );
}
