import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllButtonItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const AllButtonItem({required this.onTap, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Text(
                    LocaleKeys.all.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 14, color: greyText),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  SvgPicture.asset(AppIcons.chevronRightGrey)
                ],
              ),
            )
          ],
        ),
      );
}
