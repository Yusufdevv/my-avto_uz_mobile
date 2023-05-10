import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DamageButton extends StatelessWidget {
  final DamageType? damageType;
  final VoidCallback? onTap;
  final bool placedOnCar;
  final double k;

  const DamageButton({
    required this.k,
    this.onTap,
    this.damageType,
    this.placedOnCar = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: damageType == null
            ? Container(
                height: 18 * k,
                width: 18 * k,
                margin: EdgeInsets.all(placedOnCar ? 5 : 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .whiteToGondola,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffE5E5E5),
                      offset: Offset(0, 4),
                      blurRadius: 24,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 2 * k,
                      width: 10 * k,
                      decoration: BoxDecoration(
                          color: emerald,
                          borderRadius: BorderRadius.circular(k)),
                    ),
                    Container(
                      width: 2 * k,
                      height: 10 * k,
                      decoration: BoxDecoration(
                          color: emerald,
                          borderRadius: BorderRadius.circular(k)),
                    )
                  ],
                ),
              )
            : Container(
                height: 18 * k,
                width: 18 * k,
                margin: EdgeInsets.all(placedOnCar ? 5 : 0),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyFunctions.getStatusColor(damageType),
                ),
                child: damageType == DamageType.ideal
                    ? Padding(
                        padding: EdgeInsets.all(k > 1.6 ? 4 : 0),
                        child: SvgPicture.asset(
                          AppIcons.check,
                          color: white,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 2 * k),
                            height: 6 * k,
                            width: 2 * k,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(k),
                                color: white),
                          ),
                          Container(
                            height: 2 * k,
                            width: 2 * k,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(k),
                              color: white,
                            ),
                          ),
                        ],
                      ),
              ),
      );
}
