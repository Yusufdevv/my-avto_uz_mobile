import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_button.dart';
import 'package:flutter/material.dart';

class CarStatusIconInPicture extends StatelessWidget {
  final DamageType type;
  final Alignment alignment;
  final double k;

  const CarStatusIconInPicture({
    required this.type,
    required this.alignment,
    required this.k,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
     alignment: alignment,
      child: DamageButton(
        k: k,
        damageType: type,
      ));
}
