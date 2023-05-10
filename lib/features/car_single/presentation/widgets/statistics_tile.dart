import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/car_single/domain/entities/car_statistic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatisticsTile extends StatelessWidget {
  final CarStatistic carStatistic;

  const StatisticsTile({
    required this.carStatistic,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(
        carStatistic.icon,
        width: 16,
        height: 16,
      ),
      const SizedBox(
        width: 8,
      ),
      Text(
        carStatistic.valueText,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontWeight: FontWeight.w600, fontSize: 12, color: suvaGray),
      )
    ],
  );
}
