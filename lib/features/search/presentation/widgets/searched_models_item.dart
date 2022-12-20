import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/search/presentation/widgets/highlighted_text.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  Widget build(BuildContext context) => Container(
        color: white,
        child: WButton(
          color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          height: 60,
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: CachedNetworkImage(
                  imageUrl: 'https://source.unsplash.com/random/6151',
                  placeholder: (context, url) => Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      border: Border.all(color: dividerColor),
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: SvgPicture.asset(AppIcons.car),
                  ),
                  height: 24,
                  width: 24,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HighlightedText(
                    allText: fullText,
                    highlightedText: searchText,
                    highlightColor:
                        LightThemeColors.tangerineYellowToMediumSlateBlue,
                    textStyle: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 13),
                    textStyleHighlight: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    LocaleKeys.cars.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
