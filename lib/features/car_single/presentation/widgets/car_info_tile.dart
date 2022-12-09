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
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    entity.title + ' ',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 14, color: grey),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: dividerColor))),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                ' ' + entity.value,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w600, fontSize: 14, color: grey),
              ),
            ),
          ],
        ),
      );
}
