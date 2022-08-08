import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/domain/entities/car_statistic.dart';
import 'package:auto/features/car_single/presentation/widgets/car_action_box.dart';
import 'package:flutter/material.dart';

class CarActions extends StatelessWidget {
  const CarActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CarActionsBox(
                carStatistic: CarStatistic(
                    valueText: 'Отчет (VIN)', icon: AppIcons.settings)),
            CarActionsBox(
                carStatistic: CarStatistic(
                    valueText: 'Сравнить', icon: AppIcons.settings)),
            CarActionsBox(
                carStatistic: CarStatistic(
                    valueText: 'В заметку', icon: AppIcons.settings)),
            CarActionsBox(
                carStatistic: CarStatistic(
                    valueText: 'Поделиться', icon: AppIcons.settings)),
          ],
        ),
      );
}
