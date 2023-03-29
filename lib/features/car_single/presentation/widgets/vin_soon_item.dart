import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VinSoonItem extends StatelessWidget {
  const VinSoonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context)
              .extension<ThemedColors>()!
              .whiteToDark,
          border: Border.all(
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .divider,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: const Color(
                  0xff5ECC81,
                ),
                borderRadius: BorderRadius.circular(
                  4,
                ),
              ),
              child: Text(
                LocaleKeys.soon.tr(),
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        LocaleKeys.VIN_check_report.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        LocaleKeys.vin_check_text.tr(),
                        // maxLines: 3,
                        // overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    AppImages.vin_soon,
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
