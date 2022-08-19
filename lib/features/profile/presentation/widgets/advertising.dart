import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/search/presentation/widgets/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Advertising extends StatefulWidget {
  final String image1;
  final String imege2;
  final bool isSalon;
  final bool isClient;

  const Advertising({
    Key? key,
    required this.image1,
    required this.imege2,
    required this.isSalon,
    required this.isClient,
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
              Stack(
                children: [
                  CachedImage(
                    height: 201,
                    width: 264,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    imageUrl: widget.image1,
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
                            Text('С пробегом',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: green)),
                          ],
                        ),
                      ))
                ],
              ),
              const SizedBox(width: 4),
              CachedImage(
                height: 201,
                width: 264,
                imageUrl: widget.imege2,
              ),
              const SizedBox(width: 4),
              if (widget.isClient)
                WScaleAnimation(
                  onTap: () {
                    showCupertinoModalPopup(
                        context: context,
                        barrierColor: black.withOpacity(.7),
                        builder: (context) => const CallBottomSheet());
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
                          'Позвонить',
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
                        'Купить',
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
