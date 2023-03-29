import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_button.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_back.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_front.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_left.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_right.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DamageCarsItem extends StatelessWidget {
  final OnDamageButtonPressed onPressed;
  final Map<DamagedPart, DamageType> damagedParts;

  const DamageCarsItem(
      {required this.onPressed, required this.damagedParts, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          FromLeft(damagedParts: damagedParts, onPressed: onPressed),
          const SizedBox(height: 32),
          FromFront(damagedParts: damagedParts, onPressed: onPressed),
          const SizedBox(height: 32),
          FromBack(damagedParts: damagedParts, onPressed: onPressed),
          const SizedBox(height: 32),
          FromRight(damagedParts: damagedParts, onPressed: onPressed),
        ],
      );
}
