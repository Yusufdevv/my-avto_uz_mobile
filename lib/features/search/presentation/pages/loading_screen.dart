import 'package:auto/assets/colors/light.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoActivityIndicator(radius: 16),
            const SizedBox(height: 12),
            Text(
              LocaleKeys.loading_data.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: LightThemeColors.greyTextColor),
            )
          ],
        ),
      );
}
