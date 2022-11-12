import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_highlited_textfield.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchedModelsItem extends StatelessWidget {
  final String fullText;
  final String searchText;
  final VoidCallback onTap;
  const SearchedModelsItem(
      {required this.fullText,
      required this.searchText,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          margin: const EdgeInsets.only(bottom: 1),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          child: Row(
            children: [
              // Image.asset(AppImages.bmw),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WHighlightedText(
                    highlightedTextStyle: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                    allText: fullText,
                    highlightedText: searchText,
                    highlightColor:
                        LightThemeColors.tangerineYellowToMediumSlateBlue,
                  ),
                  Text(
                    LocaleKeys.cars.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: grey),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
