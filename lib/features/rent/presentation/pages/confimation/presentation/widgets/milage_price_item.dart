import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MileagePriceItem extends StatelessWidget {
  const MileagePriceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
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
              'Среднесуточный пробег',
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  '200 км.',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: greyText, fontSize: 12),
                ),
                Text(
                  'бесплатно',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: grey),
                ),
                const Spacer(),
                SvgPicture.asset(Theme.of(context).extension<ThemedIcons>()!.check),
              ],
            ),
            const SizedBox(height: 8,),
            Divider(
              thickness: 1,
              color: Theme.of(context).dividerColor,
            ),
            Row(
              children: [
                Text(
                  '200 км.',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: greyText, fontSize: 12),
                ),
                Text(
                  '130 тыс./сутки',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: grey),
                ),
                const Spacer(),
                SvgPicture.asset(Theme.of(context).extension<ThemedIcons>()!.check),
              ],
            ),

            const SizedBox(height: 8,),
            Divider(
              thickness: 1,
              color: Theme.of(context).dividerColor,
            ),
            Row(
              children: [
                Text(
                  '200 км.',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: greyText, fontSize: 12),
                ),
                Text(
                  '200 тыс./сутки',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: grey),
                ),
                const Spacer(),
                SvgPicture.asset(Theme.of(context).extension<ThemedIcons>()!.check),
              ],
            ),
          ],
        ),
      );
}
