import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_button.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/from_left.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FromFront extends StatelessWidget {
  final Map<DamagedPart, DamageType> damagedParts;
  final OnDamageButtonPressed onPressed;

  const FromFront(
      {required this.damagedParts, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.carFromFront,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: -2,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.roof],
                  onTap: () {
                    onPressed(DamagedPart.roof);
                  }),
            ),
            Positioned(
              top: 25,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.hood],
                  onTap: () {
                    onPressed(DamagedPart.hood);
                  }),
            ),
            Positioned(
              bottom: 11,
              child: DamageButton(
                  damageType: damagedParts[DamagedPart.frontBumper],
                  onTap: () {
                    onPressed(DamagedPart.frontBumper);
                  }),
            ),
          ],
        ),
      );
}
