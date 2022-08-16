import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
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
              'Общая оценка',
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
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
                  unratedColor: Theme.of(context).extension<ThemedColors>()!.solitudeToDolphinBorder,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                  itemBuilder: (context, _) => SizedBox(height: 16, width: 16, child: SvgPicture.asset(AppIcons.star)),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(width: 12,),
                Text(
                  '57 моделей, 9 отзывов',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
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
                      text: 'Плюсы',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: green),
                      children: [
                        TextSpan(
                          text: ' (30)',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 16, color: grey),
                        ),
                      ]),
                ),
                const SizedBox(width: 28,),
                RichText(
                  text: TextSpan(
                      text: 'Минусы',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: red),
                      children: [
                        TextSpan(
                          text: ' (5)',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
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
