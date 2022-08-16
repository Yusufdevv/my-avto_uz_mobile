import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/rent/domain/entities/single_car_entity.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/info_item.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';

class SingleCarInfoItem extends StatelessWidget {
  final SingleCarsEntity singleCarsEntity;
  const SingleCarInfoItem({required this.singleCarsEntity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Об автомобиле',
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 8,),
            InfoItem(title: 'Год выпуска', description: singleCarsEntity.yearIssue),
            InfoItem(title: 'Пробег', description: '${MyFunctions.getFormatCost(singleCarsEntity.mileage)} km'),
            InfoItem(title: 'Кузов', description: singleCarsEntity.carCase),
            InfoItem(title: 'Цвет', description: singleCarsEntity.color),
            InfoItem(title: 'Комплектация', description: singleCarsEntity.equipment, textStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: blue),),
            InfoItem(title: 'Объем двигателя, л', description: singleCarsEntity.sizeMotor),
            InfoItem(title: 'Коробка передач', description: singleCarsEntity.gearboxType),
            InfoItem(title: 'Кондиционер', description: singleCarsEntity.hasFreezer ? 'Есть' : 'Нет'),
            InfoItem(title: 'Привод', description: singleCarsEntity.driveUnit),
          ],
        ),
      );
}
