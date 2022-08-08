import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/car_single/domain/entities/car_detail.dart';
import 'package:auto/features/car_single/presentation/parts/car_details.dart';
import 'package:flutter/material.dart';

class CharacteristicBox extends StatelessWidget {
  final CarDetailEntity entity;
  const CharacteristicBox({Key? key,required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          children: [
            Text(
              entity.title,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 11,color: grey),
            ),
            const SizedBox(height: 3,),
            Text(
              entity.title,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
            ),

          ],
        ),
      );
}
