import 'package:auto/features/reviews/presentation/widgets/rating_info_item.dart';
import 'package:flutter/material.dart';

class RatingInfos extends StatelessWidget {
  const RatingInfos(
      {required this.appearanceRating,
      required this.comfortRating,
      required this.securityRating,
      required this.drivingRating,
      required this.reliabilityRating,
      super.key});
  final double appearanceRating;
  final double comfortRating;
  final double securityRating;
  final double drivingRating;
  final double reliabilityRating;

  @override
  Widget build(BuildContext context) => Column(
        children: [
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
      );
}
