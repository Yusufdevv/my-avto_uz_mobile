import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class AllRationItem extends StatelessWidget {
  const AllRationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          border: Border.all(
              width: 1,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToDarkRider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.overal_score.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                RatingBar.builder(
                  itemCount: 5,
                  initialRating: 3,
                  minRating: 1,
                  itemSize: 16,
                  unratedColor: Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitudeToDolphinBorder,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                  itemBuilder: (context, _) => SizedBox(
                      height: 16,
                      width: 16,
                      child: SvgPicture.asset(AppIcons.star)),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  '57 ${LocaleKeys.models.tr()}9${LocaleKeys.reviews.tr()}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: grey),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Divider(
              thickness: 1,
              color: Theme.of(context).dividerColor,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                      text: LocaleKeys.pluses.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: green),
                      children: [
                        TextSpan(
                          text: ' (30)',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 16, color: grey),
                        ),
                      ]),
                ),
                const SizedBox(
                  width: 28,
                ),
                RichText(
                  text: TextSpan(
                      text: LocaleKeys.minuses.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: red),
                      children: [
                        TextSpan(
                          text: ' (5)',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 16, color: grey),
                        ),
                      ]),
                ),
                const Spacer(),
                SvgPicture.asset(AppIcons.chevronRightGrey),
              ],
            ),
          ],
        ),
      );
}
