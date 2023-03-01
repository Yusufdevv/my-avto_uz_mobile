import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/edit_ad/presentation/edit_ad_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/information_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class MyAdDesc extends StatelessWidget {
  const MyAdDesc({
    required this.moderationStatus,
    required this.item,
    Key? key,
  }) : super(key: key);

  final AutoEntity item;
  final String moderationStatus;

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        InformationGrid(listData: [
          '${(DateTime.parse(item.publishedAt).difference(DateTime.now()).inDays ~/ 7) + 1} неделя',
          '${item.stats.viewedContactsCount}',
          '${item.stats.viewsCount}',
          '${item.stats.wishlistCount}'
        ]),
        if (item.moderationStatus != 'sold') const Divider(height: 24),
        if (item.moderationStatus == 'active')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.isExpired)
                Text(
                  LocaleKeys.this_ad_has_expired.tr(),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400, height: 1.3),
                )
              else
                RichText(
                  text: TextSpan(
                      text: LocaleKeys.sale_period_left.tr(),
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                      children: [
                        TextSpan(
                          text:
                              ' ${(DateTime.now().difference(DateTime.parse(item.expiredAt)).inDays).abs() + 1} ${LocaleKeys.day.tr()}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w600, color: orange),
                        )
                      ]),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: WButton(
                        border: Border.all(
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .borderGreyToGreen),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        borderRadius: 12,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .lightGreenToDarkGreen,
                        onTap: () {},
                        child: Row(
                          children: [
                            SvgPicture.asset(AppIcons.refresh),
                            const SizedBox(width: 8),
                            Text(
                              LocaleKeys.extends_for_7.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: mediumSeaGreen, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    WButton(
                      border: Border.all(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .borderGreyToDark,
                      ),
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToDarkRider,
                      borderRadius: 12,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 11),
                      onTap: () async {
                        final res = await Navigator.of(context,
                                rootNavigator: true)
                            .push(fade(
                                page: EditAdScreen(announcementId: item.id)));
                        if (res is bool && res) {
                          context.read<UserWishListsBloc>().add(
                              GetUserMyAdsEvent(
                                  moderationStatus: moderationStatus));
                        }
                      },
                      child: SvgPicture.asset(AppIcons.editProfile,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .iconPearlToWhite,
                          height: 20,
                          width: 20),
                    ),
                    const SizedBox(width: 8),
                    WButton(
                      border: Border.all(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .borderGreyToDark),
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToDarkRider,
                      borderRadius: 12,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 11),
                      onTap: () {
                        Share.share(
                            'https://panel.avto.uz/api/v1/car/announcement/${item.id}/detail/');
                      },
                      child: SvgPicture.asset(AppIcons.share,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .mediumSlateBlueToWhite),
                    ),
                  ],
                ),
              ),
            ],
          )
        else if (item.moderationStatus == 'in_moderation')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.your_ad_will_be_available.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w400, color: orange),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: WButton(
                      border: Border.all(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .borderGreyToDark,
                      ),
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToDarkRider,
                      borderRadius: 12,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 11),
                      onTap: () async {
                        final res = await Navigator.of(context,
                                rootNavigator: true)
                            .push(fade(
                                page: EditAdScreen(announcementId: item.id)));
                        if (res is bool && res) {
                          context.read<UserWishListsBloc>().add(
                              GetUserMyAdsEvent(
                                  moderationStatus: moderationStatus));
                        }
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.editProfile,
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .iconPearlToWhite,
                              height: 20,
                              width: 20),
                          const SizedBox(width: 8),
                          Text(
                            LocaleKeys.editing_ad.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 15, color: secondary),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(width: 8),
                  // WButton(
                  //   border: Border.all(
                  //       color: Theme.of(context)
                  //           .extension<ThemedColors>()!
                  //           .borderGreyToDark),
                  //   color: Theme.of(context)
                  //       .extension<ThemedColors>()!
                  //       .whiteToDarkRider,
                  //   borderRadius: 12,
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 10, horizontal: 11),
                  //   onTap: () {
                  //     Share.share(
                  //         'https://panel.avto.uz/api/v1/car/announcement/${item.id}/detail/');
                  //   },
                  //   child: SvgPicture.asset(AppIcons.share,
                  //       color: Theme.of(context)
                  //           .extension<ThemedColors>()!
                  //           .mediumSlateBlueToWhite),
                  // ),
                ],
              )
            ],
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}
