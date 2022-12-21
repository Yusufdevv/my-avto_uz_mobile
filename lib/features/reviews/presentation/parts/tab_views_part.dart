import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/reviews/presentation/pages/reviews_body_screen.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class TabViewsPart extends StatelessWidget {
  final FormzStatus status;
  final List<AutoEntity> entity;
  final int count;
  final bool fetchMore;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  const TabViewsPart(
      {required this.entity,
      required this.status,
      required this.count,
      required this.fetchMore,
      this.loadingWidget,
      this.errorWidget,
      super.key});

  @override
  Widget build(BuildContext context) => Paginator(
        paginatorStatus: status,
        itemBuilder: (context, index) => ReviewsBodyScreen(
          imageUrl: 'state.entity[index]',
          status: status,
          avgRating: entity[index].avgStar,
          minuses: entity[index].negatives,
          pluses: entity[index].positives,
          reviewCount: entity[index].commentsCount,
          appearanceRating: entity[index].starAnswers[index].starCount.toDouble(),
          comfortRating: entity[index].starAnswers[index].starCount.toDouble(),
          drivingRating: entity[index].starAnswers[index].starCount.toDouble(),
          reliabilityRating: entity[index].starAnswers[index].starCount.toDouble(),
          securityRating: entity[index].starAnswers[index].starCount.toDouble(),
        ),
        itemCount: count,
        fetchMoreFunction: () {},
        hasMoreToFetch: fetchMore,
        loadingWidget: loadingWidget,
        errorWidget: errorWidget ?? const Center(child: Text('Error')),
      );
}
