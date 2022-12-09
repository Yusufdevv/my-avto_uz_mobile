import 'dart:ui';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/car_single/presentation/widgets/cars_price_controlling.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarPriceBottom extends StatelessWidget {
  const CarPriceBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '≈ 488 000 000 UZS',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 24, color: const Color(0xff171725)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppIcons.close,
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: blue),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Хорошая цена',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white),
                    ),
                    RotatedBox(
                        quarterTurns: 1,
                        child: SvgPicture.asset(
                          AppIcons.chevronLeft,
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
              color: borderCircular,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.price_of_similar_cars.tr(),
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                  ),
                  Text(
                    ' 400 000 000 UZS',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 16, color: profileContainers),
                  ),
                ],
              ),
            ),
            const CarsPrice(
              date: '25 марта',
              price: '+ 8 000 000 UZS',
              totalPrice: '488 000 000 UZS',
            ),
            const Divider(
              color: grey,
              indent: 16,
              endIndent: 16,
            ),
            const CarsPrice(
              date: '25 марта',
              price: 'Стартовая цена',
              totalPrice: '480 000 000 UZS',
            ),
            const Divider(
              color: grey,
            ),
            Image.asset(
              AppImages.optimal,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          ],
        ),
      );
}
