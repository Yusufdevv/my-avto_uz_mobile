import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NothingFoundScreen extends StatelessWidget {
  const NothingFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: border,
                  borderRadius: BorderRadius.circular(150),
                ),
                height: 92,
                width: 92,
                margin: const EdgeInsets.only(bottom: 24),
                child: Image.asset(
                  StorageRepository.getString(
                      StorageKeys.THEME_MODE) ==
                      'light'
                      ? AppIcons.carIcon
                      : AppIcons.carDark,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                LocaleKeys.no_results.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                LocaleKeys.sorry_no_results.tr(),
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: greyText),
              ),
            ],
          ),
        ),
      );
}
