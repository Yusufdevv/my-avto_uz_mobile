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
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 12, bottom: 12),
          padding: const EdgeInsets.only(bottom: 6),
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: Column(
            children: [
              SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
                    child: Row(
                      children: [
                        ...List.generate(
                            images.length,
                            (index) => Stack(
                                  children: [
                                    CachedImage(
                                      height: 201,
                                      width: 264,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                      imageUrl: images[index],
                                    ),
                                    Positioned(
                                        top: 4,
                                        left: 4,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 4),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: white,
                                          ),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  AppIcons.shieldCheck),
                                              const SizedBox(width: 4),
                                              Text(LocaleKeys.with_Mileage.tr(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(color: green)),
                                            ],
                                          ),
                                        ))
                                  ],
                                )),
                        const SizedBox(width: 4),
                        if (!widget.isSalon)
                          WScaleAnimation(
                            onTap: () {
                              bottomSheetForCalling(
                                  context, '+998 99 344 12 14');
                            },
                            child: Container(
                              height: 201,
                              width: 264,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                                color: green,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppIcons.phone),
                                  Text(
                                    LocaleKeys.call.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(color: white),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else if (widget.isSalon)
                          Container(
                            height: 201,
                            width: 264,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
                              color: red,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppIcons.shopping),
                                Text(
                                  LocaleKeys.buy.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: white),
                                )
                              ],
                            ),
                          )
                        else
                          const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
              // Advertising(
              //   isSalon: true,
              //   images: [image1, imege2],
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Mercedes-Benz Sprinter',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 14),
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
                    Row(
                      children: [
                        Text(
                          '227 000 000 UZS',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: green, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '270 000 000 UZS',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: grey),
                        )
                      ],
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
                          text: LocaleKeys.sale_period_left.tr(),
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                          children: [
                            TextSpan(
                              text: '4${LocaleKeys.days.tr()}',
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
                                  SvgPicture.asset(AppIcons.refresh),
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
              ),
            ],
          ),
        ),
      );
}
