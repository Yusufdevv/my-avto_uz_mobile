import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmptyComparison extends StatelessWidget {
  final VoidCallback onTap;

  const EmptyComparison({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 92,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .solitude1ToNero),
                  child: Image.asset(
                    StorageRepository.getString(StorageKeys.THEME_MODE) ==
                            'light'
                        ? AppIcons.carIcon
                        : AppIcons.carDark,
                    height: 92,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    LocaleKeys.add_car_comparison.tr(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .midnightExpressToGreySuit,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: WButton(
              onTap: onTap,
              color: purple,
              text: LocaleKeys.add_car.tr(),
            ),
          )
        ],
      );
}
