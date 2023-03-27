import 'dart:developer';
import 'dart:io';
import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/profile/presentation/widgets/rate_us_text.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                RateUsText(
                    locale: StorageRepository.getString(StorageKeys.LANGUAGE)),
                WButton(
                  shadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 20,
                        color: orange.withOpacity(0.2))
                  ],
                  margin: const EdgeInsets.only(top: 12),
                  height: 36,
                  width: 150,
                  onTap: () {
                    if (Platform.isIOS) {
                      launchUrl(
                          Uri.parse(
                              'https://apps.apple.com/ru/app/tafsiri-hilol/id1130844977'),
                          mode: LaunchMode.externalApplication);
                    } else if (Platform.isAndroid) {
                      launchUrl(
                          Uri.parse(
                              'https://play.google.com/store/search?q=tafsiri+hilol&c=apps&hl=en&gl=US'),
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Text(LocaleKeys.rate.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600)),
                )
              ],
            ),
            const Spacer(),
            Image.asset(AppImages.stars, height: 136),
          ],
        ),
      );
}
