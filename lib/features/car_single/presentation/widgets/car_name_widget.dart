import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/car_single/presentation/parts/car_actions.dart';
import 'package:auto/features/car_single/presentation/parts/car_details.dart';
import 'package:auto/features/car_single/presentation/parts/statistics.dart';
import 'package:auto/features/car_single/presentation/widgets/car_price_bottom.dart';
import 'package:auto/features/car_single/presentation/widgets/day_like_call_item.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/widgets/moderation_status_part.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarNameWidget extends StatelessWidget {
  final String priceBsh;
  final String gasBalloonInfo;
  final bool isMine;
  final double middlePrice;
  final double ration;
  final String dateBsh;
  final String percent;
  final String fullname;
  final String price;
  final String date;
  final double percenti;
  final String currency;
  final String view;
  final String todayViewedCount;
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
  final double procent;
  final String moderationStatus;

  const CarNameWidget({
    required this.fullname,
    required this.gasBalloonInfo,
    required this.price,
    required this.date,
    required this.view,
    required this.todayViewedCount,
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
    required this.isCompared,
    required this.percenti,
    required this.procent,
    this.moderationStatus = 'active',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: isMine ? 0 : 12),
        decoration: BoxDecoration(
          // color: Colors.teal,
          color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          border: const Border(bottom: BorderSide(color: border)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            if (moderationStatus == ModerationStatusEnum.blocked.value)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ModerationWidget(
                  title: LocaleKeys.blocked_by_moderator.tr(),
                  titleColor: red,
                  svgPath: AppIcons.info,
                  color: red.withOpacity(0.1),
                ),
              )
            else if (moderationStatus == ModerationStatusEnum.sold.value)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ModerationWidget(
                  title: LocaleKeys.sold.tr(),
                  titleColor: emerald,
                  color: green.withOpacity(0.1),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Text(
                fullname,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: dark),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
              child: Row(
                children: [
                  Text(
                    price,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 24, fontWeight: FontWeight.w700, color: dark),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    currency,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 24, fontWeight: FontWeight.w700, color: dark),
                  ),
                  const SizedBox(width: 12),
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
                          percenti: percenti,
                          procent: procent,
                        ),
                      );
                    },
                    height: 24,
                    borderRadius: 6,
                    color: MyFunctions.getPriceStatusColor(percenti),
                    width: 24,
                    child: SvgPicture.asset(AppIcons.chevronDown,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: CarStatistics(
                  moderationStatus: moderationStatus,
                  date: date,
                  views: view,
                  todayViewedCount: todayViewedCount,
                  id: id),
            ),
            if (moderationStatus != ModerationStatusEnum.active.value)
              const SizedBox(height: 8),
            if (moderationStatus == ModerationStatusEnum.active.value) ...{
              Divider(
                  height: 32,
                  thickness: 1,
                  endIndent: 16,
                  indent: 16,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitudeToDarkRider),
              CarActions(
                inModeration: moderationStatus,
                onVin: onVin,
                onComparison: onComparison,
                onShare: onShare,
                id: compareId,
                isComparised: isCompared,
              ),
            },
            Divider(
                thickness: 1,
                endIndent: 16,
                indent: 16,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeToDarkRider),
            CarDetails(
              gasBalloonInfo: gasBalloonInfo,
              year: year,
              mileage: mileage,
              body: body,
              color: color,
              complectation: complectation,
              engineVolume: engineVolume,
              gearType: gearType,
              uzb: uzb,
            ),
            if (isMine == true &&
                (moderationStatus == ModerationStatusEnum.active.value ||
                    moderationStatus == ModerationStatusEnum.sold.value))
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Divider(
                        thickness: 1,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .solitudeToDarkRider),
                  ),
                  DayLikeCallItem(
                    days: saleDays,
                    likes: addToFavorite,
                    calls: callToNumber,
                    leftDays: daysLeft,
                  ),
                ],
              )
          ],
        ),
      );
}
