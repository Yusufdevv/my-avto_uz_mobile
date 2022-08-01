import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/widgets/advertising.dart';
import 'package:auto/features/profile/presentation/widgets/information_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllTabs extends StatelessWidget {
  const AllTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 12),
        color: white,
        child: Column(
          children: [
            Advertising(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Mercedes-Benz Sprinter',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: dark),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: purple.withOpacity(0.1),
                        ),
                        child: Text(
                          '2020',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                            text: '227 000 000 UZS',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: green, fontWeight: FontWeight.w600),
                            children: [
                          TextSpan(
                            text: '270 000 000 UZS',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    decoration: TextDecoration.lineThrough),
                          ),
                        ])),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Mercedes-Benz Sprinter — семейство малотоннажных автомобилей компании Mercedes-Benz. Существует Mercedes-Benz Sprinter — семейство ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 13,
                        ),
                  ),
                  const InformationItems(),
                  const Divider(),
                  RichText(
                    text: TextSpan(
                        text: 'Срок действия продажи осталось:',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                            text: ' 4 дней',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
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
                            border: Border.all(color: border),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                            borderRadius: 12,
                            color: accentGreen,
                            onTap: () {},
                            child: Row(
                              children: [
                                SvgPicture.asset(AppIcons.refresh),
                                const SizedBox(width: 8),
                                Text(
                                  'Продлить еще на 7 дней',
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
                          border: Border.all(color: border),
                          color: white,
                          borderRadius: 12,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 11),
                          onTap: () {},
                          child: SvgPicture.asset(AppIcons.editProfile,
                              height: 20, width: 20),
                        ),
                        const SizedBox(width: 8),
                        WButton(
                          border: Border.all(color: border),
                          color: white,
                          borderRadius: 12,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 11),
                          onTap: () {},
                          child: SvgPicture.asset(AppIcons.share),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
