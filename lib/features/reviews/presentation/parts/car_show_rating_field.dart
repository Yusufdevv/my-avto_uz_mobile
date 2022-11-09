import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/widgets/rating_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarShowRatingField extends StatelessWidget {
  const CarShowRatingField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 241,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
            border: Border.all(color: border, width: 1),
            borderRadius: BorderRadius.circular(12),
            color: white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Общая оценка',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                ),
                const Spacer(),
                SvgPicture.asset(AppIcons.star),
                const SizedBox(width: 8),
                Text(
                  '3,6',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Владеет от 6 месяцев до года',
              style:
                  Theme.of(context).textTheme.headline2!.copyWith(fontSize: 13),
            ),
            const Divider(color: border, thickness: 1),
            const RatingInfoItem(
              title: 'Внешний вид',
              activeStarCount: 4,
              bottomPadding: 12,
            ),
            const RatingInfoItem(
              title: 'Комфорт',
              activeStarCount: 2,
              bottomPadding: 12,
            ),
            const RatingInfoItem(
              title: 'Безопасность',
              activeStarCount: 3,
              bottomPadding: 12,
            ),
            const RatingInfoItem(
              title: 'Ходовые качества',
              activeStarCount: 1,
              bottomPadding: 12,
            ),
            const RatingInfoItem(
              title: 'Надежность',
              activeStarCount: 3,
            ),
          ],
        ),
      );
}
