import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/reviews/presentation/widgets/rating_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarShowRatingField extends StatelessWidget {
  const CarShowRatingField(
      {required this.overallRating,
      required this.appearanceRating,
      required this.comfortRating,
      required this.securityRating,
      required this.drivingRating,
      required this.reliabilityRating,
      Key? key})
      : super(key: key);
  final double overallRating;
  final int appearanceRating;
  final int comfortRating;
  final int securityRating;
  final int drivingRating;
  final int reliabilityRating;
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
                  '$overallRating',
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
            RatingInfoItem(
              title: 'Внешний вид',
              activeStarCount: appearanceRating,
              bottomPadding: 12,
            ),
            RatingInfoItem(
              title: 'Комфорт',
              activeStarCount: comfortRating,
              bottomPadding: 12,
            ),
            RatingInfoItem(
              title: 'Безопасность',
              activeStarCount: securityRating,
              bottomPadding: 12,
            ),
            RatingInfoItem(
              title: 'Ходовые качества',
              activeStarCount: drivingRating,
              bottomPadding: 12,
            ),
            RatingInfoItem(
              title: 'Надежность',
              activeStarCount: reliabilityRating,
            ),
          ],
        ),
      );
}
