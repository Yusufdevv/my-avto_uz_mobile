import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SellerComment extends StatelessWidget {
  final String comment;

  const SellerComment({
    required this.comment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToDarkRider,
            ),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToNero),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.sellers_comment.tr(),
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              comment,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: profileContainers),
            )
          ],
        ),
      );
}
