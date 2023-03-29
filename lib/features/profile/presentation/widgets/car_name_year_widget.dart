import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/commercial/presentation/widgets/custom_chip.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarNameYearWidget extends StatelessWidget {
  const CarNameYearWidget({
    required this.carName,
    required this.carYear,
    required this.isNew,
    Key? key,
  }) : super(key: key);

  final String carName;
  final String carYear;
  final bool isNew;

  @override
  Widget build(BuildContext context) => RichText(
          text: TextSpan(children: [
        TextSpan(
          text: carName,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Theme.of(context)
              .extension<ThemedColors>()!
              .darkToWhite, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: CustomChip(
              label: carYear,
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
        if (isNew)
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
      ]));
}
