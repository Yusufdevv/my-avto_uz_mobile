import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/info_item.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';

class SingleCarInfoItem extends StatelessWidget {
  final RentCarEntity rentCarEntity;

  const SingleCarInfoItem({required this.rentCarEntity, Key? key})
      : super(key: key);

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
            const SizedBox(
              height: 8,
            ),
            InfoItem(
                title: 'Год выпуска',
                description: rentCarEntity.year.toString()),
            InfoItem(
                title: 'Пробег',
                description:
                    '${MyFunctions.getFormatCost(rentCarEntity.distanceTraveled.toString())} km'),
            InfoItem(title: 'Кузов', description: rentCarEntity.bodyType.type),
            InfoItem(title: 'Цвет', description: rentCarEntity.color),
            InfoItem(
              title: 'Комплектация',
              description: rentCarEntity.modificationType.power,
              textStyle:
                  Theme.of(context).textTheme.subtitle2!.copyWith(color: blue),
            ),
            InfoItem(
                title: 'Объем двигателя, л',
                description: rentCarEntity.modificationType.volume),
            InfoItem(
                title: 'Коробка передач',
                description: rentCarEntity.gearboxType.type),
            InfoItem(
                title: 'Кондиционер',
                description: rentCarEntity.hasAirConditioner ? 'Есть' : 'Нет'),
            InfoItem(
                title: 'Привод', description: rentCarEntity.driveType.type),
          ],
        ),
      );
}
