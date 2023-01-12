import 'dart:ui';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/car_single/presentation/widgets/cars_price_controlling.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarPriceBottom extends StatelessWidget {
  final String price;
  final String currency;
  final String middlePrice;
  final String ration;
  final String date;
  final String percent;

  const CarPriceBottom(
      {Key? key,
      required this.price,
      required this.middlePrice,
      required this.ration,
      required this.date,
      required this.percent,
      required this.currency})
      : super(key: key);

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
                children: [
                  Text(
                    MyFunctions.getFormatCost(price),
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: const Color(0xff171725)),
                  ),
                  Text(
                    currency == 'USD' ? ' USD' : ' UZS',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: const Color(0xff171725)),
                  ),
                  const Spacer(),
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
                print('currency ${currency}');
                Navigator.of(context).pop();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4), color: blue),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Оптимальная цена',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.white),
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

            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
            //   color: borderCircular,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       // Text(
            //       //   LocaleKeys.price_of_similar_cars.tr(),
            //       //   style: Theme.of(context).textTheme.headline2!.copyWith(
            //       //         fontWeight: FontWeight.w400,
            //       //         fontSize: 14,
            //       //       ),
            //       // ),
            //       // Text(
            //       //   ' 400 000 000 UZS',
            //       //   style: Theme.of(context)
            //       //       .textTheme
            //       //       .headline2!
            //       //       .copyWith(fontWeight: FontWeight.w600, fontSize: 16, color: profileContainers),
            //       // ),
            //     ],
            //   ),
            // ),

            Image.asset(
              AppImages.optimal,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
            CarsPrice(
              date: 'Соотношение',
              price: 'Дешевле с.ц:',
              totalPrice: 'на ${ration} (${percent} %)',
              textColor: const Color(0xff5ECC81),
            ),
            const Divider(
              indent: 16,
              endIndent: 16,
            ),
            CarsPrice(
              date: 'Состояние рынка на ${date}',
              price: 'Средняя цена:',
              totalPrice: '≈ ${middlePrice}',
              textColor: profileContainers,
            ),
          ],
        ),
      );
}
