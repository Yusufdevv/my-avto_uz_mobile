import 'dart:ui';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutCarPriceBottom extends StatelessWidget {
  const AboutCarPriceBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Как рассчитывается \nсредняя цена',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: const Color(0xff171725)),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },    behavior: HitTestBehavior.opaque,
                  child: SvgPicture.asset(
                    AppIcons.close,
                    width: 32,
                    height: 32,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16, top: 16),
              child: Divider(),
            ),
            Text(
              'Мы сравнили все похожие авто на \nauto.uz по параметрам:',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color(
                      0xff171725,
                    ),
                  ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              padding: const EdgeInsets.only(
                  left: 12, top: 12, bottom: 12, right: 12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ellip),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Год выпуска',
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: dark,
                                    ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ellip),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Пробег',
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: dark,
                                    ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ellip),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Позиция',
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: dark,
                                    ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ellip),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Марка',
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: dark,
                                    ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ellip),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Модель',
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: dark,
                                    ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.ellip),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Состояние краски',
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: dark,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
