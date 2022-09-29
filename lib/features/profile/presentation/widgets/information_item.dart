import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InformationItems extends StatefulWidget {
  const InformationItems({Key? key}) : super(key: key);

  @override
  State<InformationItems> createState() => _InformationItemsState();
}

class _InformationItemsState extends State<InformationItems> {
  final List title = <String>[
    '8 неделя',
    '44',
    '12',
    '9',
  ];

  final List subTitle = <String>[
    LocaleKeys.in_sale.tr(),
    LocaleKeys.views.tr(),
    LocaleKeys.added_favorites.tr(),
    LocaleKeys.calls.tr(),
  ];

  double finalAngle = 0;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: WScaleAnimation(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 4, right: 4),
                      padding:
                          const EdgeInsets.only(top: 8, bottom: 8, left: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .greyContainer26,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            title[0],
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 16),
                          ),
                          Text(subTitle[0],
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: WScaleAnimation(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 4, bottom: 4),
                      padding:
                          const EdgeInsets.only(top: 8, bottom: 8, left: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .greenContainer26,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            title[2],
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 16),
                          ),
                          Text(subTitle[2],
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: WScaleAnimation(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(top: 4, right: 4),
                      padding:
                          const EdgeInsets.only(top: 8, bottom: 8, left: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .redContainer26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            title[1],
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 16),
                          ),
                          Text(subTitle[1],
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: WScaleAnimation(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 4, top: 4),
                      padding:
                          const EdgeInsets.only(top: 8, bottom: 8, left: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .blueContainer26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            title[3],
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 16),
                          ),
                          Text(subTitle[3],
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
