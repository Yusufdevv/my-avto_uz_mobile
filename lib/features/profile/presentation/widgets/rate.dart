import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  const Rate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          border: Border.all(color: orange),
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.rate.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                if (Platform.isIOS)
                  Text(
                    'нас в App Store',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                else
                  Text('нас в Play Market',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontWeight: FontWeight.w600)),
                WButton(
                  shadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 20,
                        color: orange.withOpacity(0.2))
                  ],
                  margin: const EdgeInsets.only(top: 12),
                  height: SizeConfig.v(36),
                  width: SizeConfig.h(150),
                  // padding:
                  //     const EdgeInsets.symmetric(vertical: 8, horizontal: 46),
                  onTap: () {},
                  child: Text(
                    'Оценить',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            const Spacer(),
            Image.asset(
              AppImages.stars,
              height: 136,
            ),
          ],
        ),
      );
}
