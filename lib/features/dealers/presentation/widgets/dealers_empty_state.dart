import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
              child: Image.asset(
                StorageRepository.getString(StorageKeys.THEME_MODE) == 'light'
                    ? AppIcons.carIcon
                    : AppIcons.carDark,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              LocaleKeys.no_dealer.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
}
