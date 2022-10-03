import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceIndicator extends StatelessWidget {
  const PriceIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 175,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xff695CEA).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppIcons.crown,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      LocaleKeys.see_price_statustic.tr(),
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: purple),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Image.asset(
                  AppImages.priceConditions,
                  width: double.maxFinite,
                  fit: BoxFit.contain,
                ))
          ],
        ),
      );
}
