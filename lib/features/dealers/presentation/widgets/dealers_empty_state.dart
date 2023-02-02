import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 92,
              width: 92,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: solitude,
                shape: BoxShape.circle,
              ),
              child: Image.asset(AppImages.noItemFoundCar),
            ),
            const SizedBox(height: 24),
            Text(
              LocaleKeys.no_dealer.tr(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
}
