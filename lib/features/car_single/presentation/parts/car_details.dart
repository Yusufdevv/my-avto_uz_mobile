import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/domain/entities/car_detail.dart';
import 'package:auto/features/car_single/presentation/widgets/car_info_tile.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({Key? key}) : super(key: key);

  static const List<CarDetailEntity> list = [
    CarDetailEntity(value: '2016', title: 'Год выпуска'),
    CarDetailEntity(value: '98 000 км', title: 'Пробег'),
    CarDetailEntity(value: 'Седан', title: 'Кузов'),
    CarDetailEntity(value: '''Черный
(металлик)''', title: 'Цвет'),
    CarDetailEntity(value: 'Luxury', title: 'Комплектация'),
    CarDetailEntity(value: '2.1', title: 'Объем двигателя, л'),
    CarDetailEntity(value: 'Механика', title: 'Коробка передач'),
    CarDetailEntity(value: 'Да', title: 'Растаможен в Узбекистане'),
  ];

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,

    decoration: BoxDecoration(  color: Theme.of(context)
        .extension<ThemedColors>()!
        .whiteToDark,
      border: Border(
        bottom: BorderSide(
          width: 1,
          color: Theme.of(context).extension<ThemedColors>()!.solitudeToDarkRider
        )
      )
    ),
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
    child: Column(
          children: List.generate(
              list.length, (index) => CarInfoTile(entity: list[index])),
        ),
      );
}
