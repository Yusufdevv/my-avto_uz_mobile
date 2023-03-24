import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarModelItem extends StatelessWidget {
  const CarModelItem({
    required this.count,
    required this.onTapSelect,
    required this.onTapShow,
    required this.isCheck,
    required this.imageUrl,
    required this.title,
    Key? key,
  }) : super(key: key);

  final int count;
  final VoidCallback onTapSelect;
  final VoidCallback onTapShow;
  final String imageUrl;
  final String title;
  final bool isCheck;

  @override
  Widget build(BuildContext context) => Container(
        height: 132,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 19,
                  color: dark.withOpacity(.07))
            ]),
        child: Column(
          children: [
            WButton(
              height: 40,
              onTap: onTapSelect,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToGondola,
              border: Border.all(
                width: 1,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeToPayneGrey,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  if (imageUrl.isEmpty)
                    SvgPicture.asset(
                      AppIcons.vehicle,
                    )
                  else
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: 28,
                      width: 28,
                    ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    width: 2,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToCharcoal,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title.trim().isEmpty
                        ? LocaleKeys.choose_brand_model.tr()
                        : title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 14,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .midnightExpressToDolphin),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            WButton(
              height: 44,
              onTap: onTapShow,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .lightSlateBlue12ToLightSlateBlue,
              border: Border.all(
                width: 1,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeToPayneGrey,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              text: title.isEmpty
                  ? LocaleKeys.choose_brand.tr()
                  : count > 0
                      ? LocaleKeys.show_offers.tr(args: [
                          MyFunctions.getThousandsSeparatedPrice('$count')
                        ], namedArgs: {
                          'apendix': MyFunctions.getAppendix(count)
                        })
                      : LocaleKeys.no_offers.tr(),
              textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 14,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .mediumSlateBlueToWhite),
            ),
          ],
        ),
      );
}
