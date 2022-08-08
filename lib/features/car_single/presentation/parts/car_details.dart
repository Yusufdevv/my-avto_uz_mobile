import 'package:auto/features/car_single/domain/entities/car_detail.dart';
import 'package:auto/features/car_single/presentation/widgets/car_info_tile.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({Key? key}) : super(key: key);

  static const List<CarDetailEntity> list = [
    CarDetailEntity(value: '2016', title: 'Год выпуска'),
    CarDetailEntity(value: '98 000 км', title: 'Пробег'),
    CarDetailEntity(value: '2016', title: 'Год выпуска'),
    CarDetailEntity(value: '2016', title: 'Год выпуска'),
  ];

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          children: List.generate(
              list.length, (index) => CarInfoTile(entity: list[index])),
        ),
      );
}
