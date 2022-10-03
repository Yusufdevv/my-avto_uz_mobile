import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/car_single/presentation/parts/price_indicator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarPriceBottom extends StatelessWidget {
  const CarPriceBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(height: MediaQuery.of(context).size.height*0.72,
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '488 000 000 UZS',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 24),
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
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: blue),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Хорошая цена',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 12),
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
            const SizedBox(
              height: 28,
            ),
            Text(
              LocaleKeys.price_of_similar_cars.tr(),
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w400, fontSize: 14, color: grey),
            ),
            Text(
              '400 000 000 UZS',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: strokeDark,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              '25 марта',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w400, fontSize: 14, color: grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '+400 000 000 UZS',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                Text(
                  '800 000 000 UZS',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: strokeDark,
            ),
            const SizedBox(
              height: 12,
            ),
            PriceIndicator()
          ],
        ),
      );
}
