import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/profile/presentation/widgets/information_item.dart';
import 'package:auto/features/search/presentation/part/bottom_sheet_for_calling.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllAds extends StatefulWidget {
  final bool isSalon;

  const AllAds({this.isSalon = true, Key? key}) : super(key: key);

  @override
  State<AllAds> createState() => _AllAdsState();
}

class _AllAdsState extends State<AllAds> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1659812903095-d7e87abb0b3c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1658856226250-5b236fa6137d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ];

  @override
  Widget build(BuildContext context) => Container(
        color: secondBackground,
        child: ListView.builder(
            padding: const EdgeInsets.only(),
            itemCount: 5,
            // ignore: prefer_expression_function_bodies
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12, top: index == 0 ? 12 : 0),
                child: Container(
                  padding: const EdgeInsets.only(top: 12),
                  color: white,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            children: [
                              ...List.generate(
                                images.length,
                                (index) => Padding(
                                  padding:
                                      EdgeInsets.only(left: index == 0 ? 0 : 4),
                                  child: Stack(
                                    children: [
                                      CachedImage(
                                        height: 201,
                                        width: 264,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              index == 0 ? 8 : 0),
                                          bottomLeft: Radius.circular(
                                              index == 0 ? 8 : 0),
                                          topRight: Radius.circular(
                                              index == images.length - 1
                                                  ? 8
                                                  : 0),
                                          bottomRight: Radius.circular(
                                              index == images.length - 1
                                                  ? 8
                                                  : 0),
                                        ),
                                        imageUrl: images[index],
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'Mercedes-Benz Sprinter',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
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
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  '227 000 000 UZS',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          color: green,
                                          fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '270 000 000 UZS',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: grey),
                                )
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Mercedes-Benz Sprinter — семейство малотоннажных автомобилей компании Mercedes-Benz. Существует Mercedes-Benz Sprinter — семейство ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    fontSize: 13,
                                  ),
                            ),
                            if (false)
                              // ignore: dead_code
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  const InformationItems(),
                                  const Divider(
                                    height: 24,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: LocaleKeys.sale_period_left.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: ' 4 дней',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: orange),
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
                                                SvgPicture.asset(
                                                    AppIcons.refresh),
                                                const SizedBox(width: 8),
                                                Text(
                                                  LocaleKeys.extends_for_7.tr(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline2!
                                                      .copyWith(
                                                          color: mediumSeaGreen,
                                                          fontSize: 15),
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
                                          child: SvgPicture.asset(
                                              AppIcons.editProfile,
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
                                          child: SvgPicture.asset(
                                              AppIcons.share,
                                              color: Theme.of(context)
                                                  .extension<ThemedColors>()!
                                                  .mediumSlateBlueToWhite),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const SizedBox(height: 6),
                                const Divider(height: 12),
                                Text(
                                  'Не подходящие условия или предложения',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(height: 1.3, color: dark),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'В объявлении предлагаются услуги или товары, которые не относятся к сайту и нарушают его правила. На Auto.uz нельзя размещать автомобиль “только для обмена”, предлагать авто в аренду и создавать объявления о поиске ТС. Мы принимаем публикации только о продаже легковых автомобилей, коммерческого транспорта, мототехники и запчастей. Чтобы найти ТС, воспользуйтесь поиском и настройте фильтры. Исправить это объявление нельзя.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(color: dark),
                                ),
                                const SizedBox(height: 12),
                                WButton(
                                  border: Border.all(
                                      color: yellowSea.withOpacity(0.48)),
                                  width: double.maxFinite,
                                  onTap: () {},
                                  color: yellowSea.withOpacity(0.08),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AppIcons.refresh1),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Переотправить',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(
                                                color: yellowSea,
                                                fontSize: 15,
                                                height: 1.3),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
}

// Positioned(
                                      //     top: 4,
                                      //     left: 4,
                                      //     child: Container(
                                      //       padding: const EdgeInsets.symmetric(
                                      //           horizontal: 16, vertical: 4),
                                      //       decoration: BoxDecoration(
                                      //         borderRadius:
                                      //             BorderRadius.circular(4),
                                      //         color: white,
                                      //       ),
                                      //       child: Row(
                                      //         children: [
                                      //           SvgPicture.asset(
                                      //               AppIcons.shieldCheck),
                                      //           const SizedBox(width: 4),
                                      //           Text(
                                      //               LocaleKeys.with_Mileage
                                      //                   .tr(),
                                      //               style: Theme.of(context)
                                      //                   .textTheme
                                      //                   .bodyText1!
                                      //                   .copyWith(
                                      //                       color: green)),
                                      //         ],
                                      //       ),
                                      //     ))
// Advertising(
                    //   isSalon: true,
                    //   images: [image1, imege2],
                    // ),