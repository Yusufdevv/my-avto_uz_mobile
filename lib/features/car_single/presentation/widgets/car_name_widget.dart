import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/parts/car_actions.dart';
import 'package:auto/features/car_single/presentation/parts/car_details.dart';
import 'package:auto/features/car_single/presentation/parts/statistics.dart';
import 'package:auto/features/car_single/presentation/widgets/car_price_bottom.dart';
import 'package:auto/features/car_single/presentation/widgets/day_like_color_item.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarNameWidget extends StatelessWidget {
  final String priceBsh;
  final bool isMine;
  final String middlePrice;
  final String ration;
  final String dateBsh;
  final String percent;
  final String fullname;
  final String price;
  final String date;
  final String currency;
  final String view;
  final String id;
  final VoidCallback onVin;
  final VoidCallback onComparison;
  final VoidCallback onShare;
  final String saleDays;
  final int addToFavorite;
  final int callToNumber;
  final String daysLeft;
  final String year;
  final String mileage;
  final String body;
  final String color;
  final String complectation;
  final String engineVolume;
  final String gearType;
  final String uzb;
  final int compareId;
  final bool isCompared;

  const CarNameWidget(
      {Key? key,
      required this.fullname,
      required this.price,
      required this.date,
      required this.view,
      required this.id,
      required this.currency,
      required this.onVin,
      required this.onComparison,
      required this.onShare,
      required this.year,
      required this.mileage,
      required this.body,
      required this.color,
      required this.complectation,
      required this.engineVolume,
      required this.gearType,
      required this.uzb,
      required this.priceBsh,
      required this.middlePrice,
      required this.ration,
      required this.dateBsh,
      required this.percent,
      required this.isMine,
      required this.saleDays,
      required this.addToFavorite,
      required this.callToNumber,
      required this.daysLeft,
      required this.compareId,
      required this.isCompared})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Text(
                fullname,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: dark,
                    ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 8,
                bottom: 12,
                left: 16,
                right: 16,
              ),
              child: Row(
                children: [
                  Text(
                    price,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: dark,
                        ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    currency,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: dark,
                        ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  WButton(
                    onTap: () {
                      showModalBottomSheet(
                        useRootNavigator: true,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => CarPriceBottom(
                          price: priceBsh,
                          middlePrice: middlePrice,
                          ration: ration,
                          date: dateBsh,
                          percent: percent,
                          currency: currency,
                        ),
                      );
                    },
                    height: 24,
                    borderRadius: 6,
                    color: blue,
                    width: 24,
                    child: SvgPicture.asset(
                      AppIcons.chevronDown,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                0,
                16,
                0,
              ),
              child: CarStatistics(
                date: date,
                views: view,
                id: id,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                0,
                16,
                0,
              ),
              child: Divider(
                height: 32,
                thickness: 1,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeToDarkRider,
              ),
            ),
            CarActions(
              onVin: onVin,
              onComparison: onComparison,
              onShare: onShare,
              id: compareId,
              isComparised: isCompared,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                0,
                16,
                0,
              ),
              child: Divider(
                thickness: 1,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeToDarkRider,
              ),
            ),
            CarDetails(
              year: year,
              mileage: mileage,
              body: body,
              color: color,
              complectation: complectation,
              engineVolume: engineVolume,
              gearType: gearType,
              uzb: uzb,
            ),
            if (isMine == true)
              DayLikeCallItem(
                days: saleDays,
                likes: addToFavorite,
                calls: callToNumber,
                leftDays: daysLeft,
              )
            else
              const SizedBox()
          ],
        ),
      );
}
