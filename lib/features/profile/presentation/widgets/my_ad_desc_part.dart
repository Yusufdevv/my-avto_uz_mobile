import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/widgets/information_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          MyFunctions.getAutoPublishDate(item.publishedAt),
          '${item.stats.viewedContactsCount}',
          '${item.stats.viewsCount}',
          '${item.stats.wishlistCount}'
        ]),
        if (item.moderationStatus != 'in_moderation' &&
            item.moderationStatus != 'sold')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(height: 24),
              RichText(
                text: TextSpan(
                    text: LocaleKeys.sale_period_left.tr(),
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                    children: [
                      TextSpan(
                        text:
                            ' ${DateTime.now().difference(DateTime.parse(item.purchaseDate))}',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w600, color: orange),
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
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
                      onTap: () {},
                      child: SvgPicture.asset(AppIcons.share,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .mediumSlateBlueToWhite),
                    ),
                  ],
                ),
              ),
            ],
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}
