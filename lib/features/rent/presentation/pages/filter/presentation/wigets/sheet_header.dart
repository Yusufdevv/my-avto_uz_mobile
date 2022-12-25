import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
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
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: dark,
                fontWeight: FontWeight.w700,
              ),
            ),
            WScaleAnimation(
              onTap: onCancelPressed,
              child: SvgPicture.asset(AppIcons.cancel, color: greyText),
            ),
          ],
        ),
      );
}
