
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VerifiredOwnerModerationItem extends StatelessWidget {
  const VerifiredOwnerModerationItem({
    required this.subtitle,
    required this.titleColor,
    required this.icon,
    super.key,
  });

  final Color titleColor;
  final String subtitle;
  final String icon;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).extension<ThemedColors>()!.solitude1ToNero,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.verified_owner.tr(),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 18, color: Theme.of(context).extension<ThemedColors>()!.darkToWhite),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: titleColor),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 77,
              width: 71,
              child: Image.asset(
                icon,
              ),
            )
          ],
        ),
      );
}
