import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditBoxWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  // ignore: always_put_required_named_parameters_first
  const EditBoxWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(right: 4, left: 8, top: 4, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context)
              .extension<ThemedColors>()!
              .whiteSmoke78ToWhiteSmoke12,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            const SizedBox(width: 12),
            WScaleAnimation(
              onTap: onTap,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .solitudeToBastille,
                      borderRadius: BorderRadius.circular(4)),
                  child: SvgPicture.asset(AppIcons.edit)),
            )
          ],
        ),
      );
}
