import 'package:auto/features/ad/domain/entities/damaged_part/damaged_part.dart';
import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';

class CarStatusIconInPicture extends StatelessWidget {
  const CarStatusIconInPicture({
    required this.informAboutDoors,
    required this.doorName,
    this.right,
    this.left,
    this.top,
    this.bottom,
    Key? key,
  }) : super(key: key);

  final List<DamagedPartsEntity> informAboutDoors;
  final String doorName;
  final double? right;
  final double? left;
  final double? top;
  final double? bottom;

  @override
  Widget build(BuildContext context) => Visibility(
        visible: MyFunctions().getStatusTitle(informAboutDoors[
                    informAboutDoors
                        .indexWhere((element) {
                          print(informAboutDoors.indexOf(element));
                      return element.part == doorName;
                    })]
                .damageType) !=
            'Идеальное',
        child: Positioned(
          right: right,
          top: top,
          left: left,
          bottom: bottom,
          child: MyFunctions().getStatusIcon(informAboutDoors[
                  informAboutDoors
                      .indexWhere((element) => element.part == doorName)]
              .damageType),
        ),
      );
}