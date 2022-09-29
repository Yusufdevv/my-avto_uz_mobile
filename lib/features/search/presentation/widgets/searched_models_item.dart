import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_highlited_textfield.dart';
import 'package:auto/features/search/domain/entities/search_item_entity.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchedModelsItem extends StatelessWidget {
  final TextEditingController controller;
  final SearchItemEntity searchItemEntity;
  const SearchedModelsItem(
      {required this.controller, required this.searchItemEntity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        margin: const EdgeInsets.only(bottom: 1),
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        child: Row(
          children: [
            Image.asset(searchItemEntity.icon),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WHighlightedText(
                  highlightedTextStyle: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                  textStyle: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                    allText: searchItemEntity.title,
                    highlightedText: controller.text,
                    highlightColor: Theme.of(context)
                        .extension<ThemedColors>()!
                        .tangerineYellowToMediumSlateBlue,
                ),
                Text(LocaleKeys.cars.tr(), style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: grey),)
              ],
            ),
          ],
        ),
      );
}
