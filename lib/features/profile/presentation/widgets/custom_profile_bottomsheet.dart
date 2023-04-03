import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfileBottomsheet extends StatelessWidget {
  const CustomProfileBottomsheet(
      {required this.title,
      required this.subTitle,
      required this.betweenHeight,
      required this.onTap,
      Key? key})
      : super(key: key);
  final int betweenHeight;
  final String title;
  final String subTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => Container(
        padding:
            const EdgeInsets.symmetric(vertical: 24, horizontal: 16).copyWith(
          bottom: 16 + MediaQuery.of(context).padding.bottom,
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  behavior: HitTestBehavior.opaque,
                  child:
                      SvgPicture.asset(AppIcons.close, height: 32, width: 32)),
            ),
            const SizedBox(height: 12),
            Text(title,
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(subTitle,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w400, fontSize: 16, color: grey),
                textAlign: TextAlign.center),
            SizedBox(height: betweenHeight.toDouble()),
            Row(
              children: [
                Expanded(
                  child: WButton(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToGondola,
                    onTap: () => Navigator.pop(context),
                    text: LocaleKeys.no.tr(),
                    textColor: Theme.of(context)
                        .extension<ThemedColors>()!
                        .dolphinToWhite,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: WButton(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .tutuToRed,
                      onTap: onTap,
                      text: LocaleKeys.yes.tr(),
                      textColor: Theme.of(context)
                          .extension<ThemedColors>()!
                          .redToWhite),
                ),
              ],
            )
          ],
        ),
      );
}
