import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/car_single/presentation/widgets/call_like_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DayLikeCallItem extends StatelessWidget {
  final String days;
  final int likes;
  final int calls;
  final String leftDays;
  final bool isExpired;
  final ModerationStatusEnum moderationStatus;

  const DayLikeCallItem({
    required this.days,
    required this.likes,
    required this.calls,
    required this.leftDays,
    required this.isExpired,
    required this.moderationStatus,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CallLikeItem(
                  icon: AppIcons.calendar,
                  number: days,
                  text: LocaleKeys.days_on_sale.tr(),
                ),
                Container(
                  width: 1,
                  height: 28,
                  color: dividerColor,
                ),
                CallLikeItem(
                  icon: AppIcons.heart,
                  number: '$likes',
                  text: LocaleKeys.added_to_favorites.tr(),
                ),
                Container(
                  width: 1,
                  height: 28,
                  color: dividerColor,
                ),
                CallLikeItem(
                  icon: AppIcons.phoneCall,
                  number: '$calls',
                  text: LocaleKeys.phone_call.tr(),
                ),
              ],
            ),
            if (!isExpired && moderationStatus == ModerationStatusEnum.active) ...{
              const SizedBox(height: 16),
              const Divider(height: 1),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: MyFunctions.isNightMode(context)
                      ? const Color(0xffFFFFFF).withOpacity(0.08)
                      : const Color(0xffFFFBFA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: LocaleKeys.u_t_e_o_t_a_p_l.tr(),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 1.4,
                          color: const Color(0xff92929D)),
                    ),
                    TextSpan(
                      text: '$leftDays ${LocaleKeys.dayss.tr()}',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 1.4,
                          color: orange),
                    )
                  ]),
                ),
              )
            },
            const SizedBox(height: 16),
          ],
        ),
      );
}
