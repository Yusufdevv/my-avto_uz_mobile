import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/domain/entities/car_statistic.dart';
import 'package:auto/features/car_single/presentation/widgets/statistics_tile.dart';
import 'package:flutter/material.dart';

class CarStatistics extends StatelessWidget {
  CarStatistics({
    Key? key,
  }) : super(key: key);

  List<CarStatistic> mockList = [
    CarStatistic(
      valueText: '2 февраля 2021',
      icon: AppIcons.settings,
    ),
    CarStatistic(
      valueText: '31 490 (629 сегодня)',
      icon: AppIcons.settings,
    ),
    CarStatistic(valueText: '8323543', icon:AppIcons.settings, titleText: ''),
  ];

  @override
  Widget build(BuildContext context) => Container(margin: EdgeInsets.only(right: 40),
    child: Wrap(
      spacing: 12,
      direction: Axis.horizontal,
      runSpacing: 12,
      children: List.generate(
        mockList.length,
        (index) => StatisticsTile(
          carStatistic: mockList[index],
        ),
      ),
    ),
  );
}
