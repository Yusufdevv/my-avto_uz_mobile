import 'package:auto/features/car_single/domain/entities/car_detail.dart';
import 'package:auto/features/car_single/presentation/widgets/characteristic_box.dart';
import 'package:flutter/material.dart';

class CharacteristicTable extends StatelessWidget {
  final String title;

  const CharacteristicTable({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Характеристики автомобиля',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            CharacteristicBox(
              entity: CarDetailEntity(
                  value: '1591 куб.см', title: 'Обьем двигателя'),
            ),

          ],
        ),
      );
}
