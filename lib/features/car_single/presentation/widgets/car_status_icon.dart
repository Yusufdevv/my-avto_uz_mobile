import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/features/common/entities/position_entity.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';

class CarStatusIconInPicture extends StatelessWidget {
  const CarStatusIconInPicture({
    required this.damageType,
    required this.damagedPart,
    required this.position,
    Key? key,
  }) : super(key: key);
  final DamageType damageType;
  final DamagedPart damagedPart;
  final DamagePosition position;

  @override
  Widget build(BuildContext context) => Positioned(
        right: position.right,
        top: position.top,
        left: position.left,
        bottom: position.bottom,
        child: MyFunctions.getStatusIcon('ideal'),
      );
}
