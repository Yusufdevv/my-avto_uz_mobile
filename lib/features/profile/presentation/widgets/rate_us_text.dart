import 'dart:io';

import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/capitalize_string_extention.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RateUsText extends StatelessWidget {
  final String locale;

  const RateUsText({required this.locale, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (locale == 'uz') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Platform.isIOS)
            Text(
              LocaleKeys.in_appstore.tr().capitalize(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            )
          else
            Text(LocaleKeys.in_playstore.tr().capitalize(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontWeight: FontWeight.w600)),
          Text(
            LocaleKeys.rate_us.tr(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.rate_us.tr(),
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        if (Platform.isIOS)
          Text(
            LocaleKeys.in_appstore.tr(),
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontWeight: FontWeight.w600),
          )
        else
          Text(LocaleKeys.in_playstore.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
