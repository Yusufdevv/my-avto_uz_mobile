import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_back.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_front.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_left.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_right.dart';
import 'package:flutter/material.dart';

class DamageCarsItem extends StatelessWidget {
  final OnDamageButtonPressed onPressed;
  final Map<DamagedPart, DamageType> damagedParts;
  final double width;
  final double k;

  const DamageCarsItem(
      {required this.onPressed,
      required this.damagedParts,
      required this.width,
      required this.k,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          FromLeft(
            k: k,
            imageSize: const Size(285, 94),
            damagedParts: damagedParts,
            onPressed: onPressed,
            width: width,
          ),
          const SizedBox(height: 32),
          FromFront(
            k: k,
            imageSize: const Size(129, 101),
            damagedParts: damagedParts,
            onPressed: onPressed,
            width: width,
          ),
          const SizedBox(height: 32),
          FromBack(
            k: k,
            imageSize: const Size(119, 95),
            damagedParts: damagedParts,
            onPressed: onPressed,
            width: width,
          ),
          const SizedBox(height: 32),
          FromRight(
            k: k,
            imageSize: const Size(285, 94),
            damagedParts: damagedParts,
            onPressed: onPressed,
            width: width,
          ),
        ],
      );
}
