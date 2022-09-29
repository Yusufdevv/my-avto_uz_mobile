import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/car_single/domain/entities/car_detail.dart';
import 'package:flutter/material.dart';

class CarInfoTile extends StatelessWidget {
  final CarDetailEntity entity;

  const CarInfoTile({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text(
              entity.title,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 14,color: grey),
            ),
            Expanded(
              child: Container(margin: const EdgeInsets.only(left: 2,right: 2),
                child: Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: const[
                     Divider(
                      color:strokeDark,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              entity.value,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 14,color: grey),
            ),
            const SizedBox(width: 70,),
          ],
        ),
      );
}
