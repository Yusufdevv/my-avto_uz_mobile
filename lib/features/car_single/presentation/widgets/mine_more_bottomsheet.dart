import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/car_single/presentation/parts/payments/service_extends_ads_page_.dart';
import 'package:auto/features/car_single/presentation/parts/payments/service_top_page.dart';
import 'package:auto/features/car_single/presentation/parts/payments/service_vip_page.dart';
import 'package:auto/features/car_single/presentation/widgets/more_action_item.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
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

  const MineMoreBottomSheet({
    required this.name,
    required this.position,
    required this.image,
    required this.onShare,
    required this.id,
    required this.status,
    required this.onSold,
    this.moderationStatus = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
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
                      color: const Color(0xffF0EFFD),
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
                                    color: const Color(
                                      0xff171725,
                                    ),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if(moderationStatus==ModerationStatusEnum.active.value || moderationStatus.isEmpty)
                  Expanded(
                  child: WScaleAnimation(
                    onTap: onShare,
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffFDEFEB),
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
                                    color: const Color(0xff171725),
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
              color: const Color(0xffF0FAF6),
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .push(fade(page:   ServiceExtendsAdsPage(announcementId: id)));
              },
              borderColor: const Color(0xff5ECC81).withOpacity(0.12),
            ),
            MoreActionItem(
              icon: AppIcons.crown,
              text: LocaleKeys.become_vip_for_3_days.tr(),
              color: const Color(0xffFFF6E1),
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(fade(
                    page: ServiceVipPage(announcementId:id)));
              },
              borderColor: const Color(0xffFFC137).withOpacity(0.12),
            ),
            MoreActionItem(
              icon: AppIcons.rocket,
              text: LocaleKeys.send_to_top.tr(),
              color: const Color(0xffFFECE7),
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(fade(
                    page: ServiceTopPage(announcementId:id)));
              },
              borderColor: const Color(0xffF63C07).withOpacity(0.12),
            ),
            MoreActionItem(
              icon: AppIcons.blue_fire,
              text: LocaleKeys.in_hot_one_line.tr(),
              color: const Color(0xffDFEFFF),
              borderColor: const Color(0xff4D88C8).withOpacity(0.12),
              onTap: () {
                // Navigator.of(context, rootNavigator: true).push(fade(
                //     page: ServiceVipPage(announcementId:id)));
              },
            ),
            MoreActionItem(
              icon: AppIcons.redMapIcon,
              text: 'Место осмотра',
              color: const Color(0xffFFECE7),
              onTap: () {},
              borderColor: const Color(0xffF63C07).withOpacity(0.12),
            ),
            if(moderationStatus==ModerationStatusEnum.active.value)
              MoreActionItem(
              icon: AppIcons.surface,
              text: LocaleKeys.close_ad.tr(),
              color: const Color(0xff55BB00).withOpacity(0.12),
              onTap: onSold,
              borderColor: const Color(0xff55BB00).withOpacity(0.12),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 24,
            ),
          ],
        ),
      );
}

// onTap: () {
// Navigator.of(context).push(fade(page: const VinPage()));
// },
