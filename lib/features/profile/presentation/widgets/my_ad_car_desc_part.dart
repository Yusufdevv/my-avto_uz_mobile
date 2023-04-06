import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/commercial/presentation/widgets/custom_chip.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAdCarDescPart extends StatelessWidget {
  const MyAdCarDescPart({
    required this.item,
    Key? key,
  }) : super(key: key);

  final AutoEntity item;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: item.absoluteCarName,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .darkToWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: CustomChip(
                      label: '${item.year}',
                      backgroundColor:
                          LightThemeColors.navBarIndicator.withOpacity(0.1),
                      borderRadius: 4,
                      labelStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: LightThemeColors.navBarIndicator,
                      ),
                    ),
                  ),
                ),
                if (item.isNew)
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: CustomChip(
                          leading: SvgPicture.asset(AppIcons.checkCurly),
                          label: LocaleKeys.neww.tr(),
                          backgroundColor: emerald.withOpacity(0.1),
                          borderRadius: 4,
                          labelStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: emerald,
                          ),
                        ),
                      ))
              ],
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                item.discount > 0.0
                    ? '${MyFunctions.getFormatCost((item.price.floor() - item.discount.floor()).toString())} ${item.currency.toUpperCase()}'
                    : '${MyFunctions.getFormatCost(item.price.floor().toString())} ${item.currency.toUpperCase()}',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: green, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 4),
              if (item.discount > 0.0)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    '${MyFunctions.getFormatCost(item.price.floor().toString())} ${item.currency.toUpperCase()}',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        decoration: TextDecoration.lineThrough, color: LightThemeColors.displayMedium),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          // if (item.description.isNotEmpty)
          Text(
            item.description.trim(),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 12, color: LightThemeColors.displayMedium),
          ),
        ],
      );
}
