import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/widgets/information_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class MyAdDesc extends StatelessWidget {
  const MyAdDesc({
    required this.item,
    Key? key,
  }) : super(key: key);

  final AutoEntity item;

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        InformationGrid(listData: [
          '${(DateTime.parse(item.publishedAt).day ~/ 7) + 1} неделя',
          '${item.stats.viewedContactsCount}',
          '${item.stats.viewsCount}',
          '${item.stats.wishlistCount}'
        ]),
        const Divider(height: 24),
        if (item.moderationStatus == 'active')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: LocaleKeys.sale_period_left.tr(),
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                    children: [
                      TextSpan(
                        text: ' 4 дней ',
                        // ' ${DateTime.now().difference(DateTime.parse(item.expiredAt))}',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                                  .headline2!
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
                      onTap: () {},
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
                'Ваше объявление будет доступно другим пользователям после того как оно успешно пройдет модерацию',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400, color: orange),
              ),
              SizedBox(height: SizeConfig.v(12)),
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
                      onTap: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.editProfile,
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .iconPearlToWhite,
                              height: 20,
                              width: 20),
                          SizedBox(width: SizeConfig.h(8)),
                          Text(
                            'Редактировать объявление',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontSize: 15, color: secondary),
                          ),
                        ],
                      ),
                    ),
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
              )
            ],
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}
