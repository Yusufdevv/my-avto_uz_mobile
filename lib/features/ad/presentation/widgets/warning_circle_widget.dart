import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WarningCircleWidget extends StatelessWidget {
  final DamageType? damageType;
  final double k;

  const WarningCircleWidget({
    required this.damageType,
    required this.k,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = MyFunctions.getStatusColor(damageType);

    return Container(
      padding: damageType == DamageType.ideal ? EdgeInsets.all(4 * k) : null,
      height: 24 * k,
      width: 24 * k,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12 * k),
        border: Border.all(
          width: 2.3 * k,
          color: color,
        ),
      ),
      child: damageType == null
          ? Padding(
              padding: EdgeInsets.all(4 * k),
              child: SvgPicture.asset(
                AppIcons.plus,
                color: color,
              ),
            )
          : damageType == DamageType.ideal
              ? SvgPicture.asset(
                  AppIcons.check,
                  color: color,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 2.2 * k),
                      width: 2.4 * k,
                      height: 7 * k,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(1.2 * k)),
                    ),
                    Container(
                      width: 2.4 * k,
                      height: 2.4 * k,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(1.2 * k)),
                    ),
                  ],
                ),
    );
  }
}
