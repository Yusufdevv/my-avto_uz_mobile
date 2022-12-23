import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/search/presentation/part/bottom_sheet_for_calling.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Advertising extends StatefulWidget {
  final List<String> images;
  final bool isSalon;

  const Advertising({
    required this.images,
    required this.isSalon,
    Key? key,
  }) : super(key: key);

  @override
  State<Advertising> createState() => _AdvertisingState();
}

class _AdvertisingState extends State<Advertising> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
          child: Row(
            children: [
              ...List.generate(
                  widget.images.length,
                  (index) => Stack(
                        children: [
                          CachedImage(
                            height: 201,
                            width: 264,
                            imageUrl: widget.images[index],
                          ),
                          Positioned(
                              top: 4,
                              left: 4,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: white,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.shieldCheck),
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
                    bottomSheetForCalling(context, '+998 99 999 99 99');
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
      );
}
