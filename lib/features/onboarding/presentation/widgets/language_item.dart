import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LanguageItem extends StatefulWidget {
  const LanguageItem({Key? key}) : super(key: key);

  @override
  State<LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: WButton(
              onTap: () {
                setState(() {
                  isSelected = true;
                });
                context.setLocale(const Locale('ru'));
                            setState(() {});
                            serviceLocator<DioSettings>()
                                .setBaseOptions(lang: 'ru');
                            StorageRepository.putString(
                                'language', 'ru');
              },
              color: isSelected
                  ? orange
                  : Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitudeToCharcoal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SvgPicture.asset(
                      AppIcons.russia,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Русский',
                    style: isSelected
                        ? Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w600, color: white)
                        : Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .greySuitToWhite),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: WButton(
              color: isSelected
                  ? Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitudeToCharcoal
                  : orange,
              onTap: () {
                setState(() {
                  isSelected = false;
                });
                 context.setLocale(const Locale('uz'));
                            setState(() {});
                            serviceLocator<DioSettings>()
                                .setBaseOptions(lang: 'uz');
                            StorageRepository.putString(
                                'language', 'uz');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SvgPicture.asset(
                      AppIcons.uzbekistan,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'O‘zbekcha',
                    style: isSelected
                        ? Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .greySuitToWhite)
                        : Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w600, color: white),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
