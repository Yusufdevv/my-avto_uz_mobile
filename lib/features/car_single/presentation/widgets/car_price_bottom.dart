import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/widgets/about_price_bottomsheet.dart';
import 'package:auto/features/car_single/presentation/widgets/car_price_2.dart';
import 'package:auto/features/car_single/presentation/widgets/cars_price_controlling.dart';
import 'package:auto/features/car_single/presentation/widgets/price_statistis_item.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarPriceBottom extends StatelessWidget {
  final String price;
  final String currency;
  final double middlePrice;
  final double ration;
  final String date;
  final String percent;
  final double percenti;
  final double procent;

  const CarPriceBottom({
    required this.price,
    required this.middlePrice,
    required this.ration,
    required this.date,
    required this.percent,
    required this.currency,
    required this.percenti,
    required this.procent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color:
              Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
          borderRadius: const BorderRadius.only(
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
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .darkToWhite),
                  ),
                  Text(
                    ' $currency',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .darkToWhite),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: SvgPicture.asset(
                      AppIcons.close,
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: MyFunctions.getPriceStatusColor(percenti)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LocaleKeys.optimal_price.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PriceStatisticItem(
              percent: percenti,
              price: MyFunctions.getFormatCost(price),
              currency: currency,
            ),
            const SizedBox(height: 16),
            const Divider(indent: 16, endIndent: 16, height: 1),
            const SizedBox(height: 24),
            CarsPrice(
              date: LocaleKeys.ratio.tr(),
              price: LocaleKeys.cheaper_sc.tr(),
              totalPrice: LocaleKeys.on.tr(args: [
                '${MyFunctions.getFormatCost(ration.ceil().toString())} $currency ($percent%)'
              ]),
              textColor: const Color(0xff5ECC81),
            ),
            const SizedBox(height: 16),
            const Divider(indent: 16, endIndent: 16, height: 1),
            const SizedBox(height: 12),
            CarsPrice2(
              date: LocaleKeys.market_condition_on.tr(args: [date]),
              price: LocaleKeys.average_price.tr(),
              totalPrice:
                  '≈ ${MyFunctions.getFormatCost(middlePrice.ceil().toString())} $currency',
              textColor: profileContainers,
            ),
            WScaleAnimation(
              onTap: () {
                showModalBottomSheet(
                    useRootNavigator: true,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => const AboutCarPriceBottom());
              },
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffF6F6F6),
                ),
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 24, bottom: 24),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.infoCircle,
                      color: const Color(0xff695CEA),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      LocaleKeys.how_the_average_price_is_calculated
                          .tr(namedArgs: {'middle': ' '}),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: dark),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
