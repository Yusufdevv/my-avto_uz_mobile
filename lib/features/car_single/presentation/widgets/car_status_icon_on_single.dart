import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_button.dart';
import 'package:auto/features/common/entities/position_entity.dart';
import 'package:flutter/material.dart';

class CarStatusIconInPicture extends StatelessWidget {
  final DamageType type;
  final DamagePosition position;

  const CarStatusIconInPicture({
    required this.type,
    required this.position,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned(
      top: position.top,
      bottom: position.bottom,
      left: position.left,
      right: position.right,
      child: DamageButton(
        damageType: type,
      ));
}
