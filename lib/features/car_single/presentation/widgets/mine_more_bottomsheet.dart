import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/car_single/presentation/pages/inspection_place_screen.dart';
import 'package:auto/features/car_single/presentation/parts/payments/service_extends_ads_page_.dart';
import 'package:auto/features/car_single/presentation/parts/payments/service_reels_page.dart';
import 'package:auto/features/car_single/presentation/parts/payments/service_top_page.dart';
import 'package:auto/features/car_single/presentation/parts/payments/service_vip_page.dart';
import 'package:auto/features/car_single/presentation/widgets/more_action_item.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class MineMoreBottomSheet extends StatelessWidget {
  final int id;
  final FormzStatus status;
  final String name;
  final String position;
  final String image;
  final VoidCallback onShare;
  final VoidCallback onSold;
  final String moderationStatus;
  final bool isExpired;
  final String expiredDate;
  final double long;
  final double lat;

  const MineMoreBottomSheet({
    required this.name,
    required this.position,
    required this.image,
    required this.onShare,
    required this.id,
    required this.status,
    required this.onSold,
    required this.isExpired,
    required this.lat,
    required this.long,
    required this.expiredDate,
    this.moderationStatus = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = isExpired
        ? DateTime.now()
        : expiredDate.isNotEmpty
            ? DateTime.parse(expiredDate)
            : DateTime.now();
    final isLightTheme = !MyFunctions.isNightMode(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 16),
              Text(
                LocaleKeys.actions_single.tr(),
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                behavior: HitTestBehavior.opaque,
                child: SvgPicture.asset(
                  AppIcons.close,
                  width: 28,
                  height: 28,
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 4),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .blueContainer26,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          StorageRepository.getString('language') == 'uz'
                              ? AppIcons.blue_vin_tezorada
                              : AppIcons.blue_vin_skoro,
                        ),
                        Text(
                          LocaleKeys.report_vin.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .blackToWhite,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (moderationStatus == ModerationStatusEnum.active.value ||
                  moderationStatus.isEmpty)
                Expanded(
                  child: WScaleAnimation(
                    onTap: onShare,
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .redContainer26,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.share,
                              height: 28,
                              color: const Color(0xffEA5930),
                            ),
                            Text(
                              LocaleKeys.share.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .blackToWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 16),
            ],
          ),
          MoreActionItem(
            icon: AppIcons.refresh,
            text: LocaleKeys.extends_for_day.tr(args: ['7']),
            color: isLightTheme
                ? const Color(0xFFF0FAF6)
                : const Color(0xFF1C3424),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(fade(
                  page: ServiceExtendsAdsPage(date: date, announcementId: id)));
            },
            borderColor: isLightTheme
                ? const Color(0xff5ECC81).withOpacity(0.12)
                : const Color(0xFF33FF74).withOpacity(0.17),
          ),
          MoreActionItem(
            icon: AppIcons.crown,
            text: LocaleKeys.become_vip_for_3_days.tr(),
            // color: Theme.of(context)
            //     .extension<ThemedColors>()!
            //     .yelowTwoContainer27,
            color: isLightTheme
                ? const Color(0xFFFFF6E1)
                : const Color(0xFF342C1C),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                  fade(page: ServiceVipPage(announcementId: id, date: date)));
            },
            borderColor: isLightTheme
                ? const Color(0xffFFC137).withOpacity(0.12)
                : const Color(0xFFFFBE33).withOpacity(0.17),
          ),
          MoreActionItem(
            icon: AppIcons.rocket,
            text: LocaleKeys.send_to_top.tr(),
            // color: Theme.of(context)
            //     .extension<ThemedColors>()!
            //     .yelowOneContainer27,
            color: isLightTheme
                ? const Color(0xFFFFECE7)
                : const Color(0xFF34211C),

            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                  fade(page: ServiceTopPage(announcementId: id, date: date)));
            },
            borderColor: isLightTheme
                ? const Color(0xffF63C07).withOpacity(0.12)
                : const Color(0xFFFF5F33).withOpacity(0.17),
          ),
          MoreActionItem(
            icon: AppIcons.reels,
            text: LocaleKeys.add_to_ways.tr(),
            // color: Theme.of(context).extension<ThemedColors>()!.blueContainer26,
            color: isLightTheme
                ? const Color(0xFFEBE8FB)
                : const Color(0xFF341C1C),

            borderColor: isLightTheme
                ? const Color(0xff4D88C8).withOpacity(0.12)
                : const Color(0xFFFF3333).withOpacity(0.17),
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .push(fade(page: ServiceReelsPage(announcementId: id)));
            },
          ),
          if (long != 0 && lat != 0)
            MoreActionItem(
              icon: AppIcons.redMapIcon,
              iconColor: blue,
              text: LocaleKeys.place_of_inspection.tr(),
              // color:Theme.of(context)
              //     .extension<ThemedColors>()!
              //     .yelowTwoContainer27,
              color: isLightTheme
                  ? const Color(0xFFFCEBE6)
                  : const Color(0xFF1C2834),

              onTap: () {
                if (long != 0 && lat != 0) {
                  Navigator.of(context, rootNavigator: true).push(fade(
                      page: InspectionPlaceSingleScreen(long: long, lat: lat)));
                }
              },
              borderColor: isLightTheme
                  ? const Color(0xffF63C07).withOpacity(0.12)
                  : const Color(0xFF3396FF).withOpacity(0.17),
            ),
          if (moderationStatus == ModerationStatusEnum.active.value)
            MoreActionItem(
              icon: AppIcons.surface,
              text: LocaleKeys.close_ad.tr(),
              // color: const Color(0xff55BB00).withOpacity(0.12),
              color: isLightTheme
                  ? const Color(0xFFEEF8E6)
                  : const Color(0xFF27341C),

              onTap: onSold,
              borderColor: isLightTheme
                  ? const Color(0xff55BB00).withOpacity(0.12)
                  : const Color(0xFF8FFF33).withOpacity(0.17),
            ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 24),
        ],
      ),
    );
  }
}
