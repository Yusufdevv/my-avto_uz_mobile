import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditItemContainer extends StatelessWidget {
  const EditItemContainer({
    required this.region,
    required this.icon,
    this.isOtherPage = false,
    Key? key,
  }) : super(key: key);

  final String region;
  final String icon;
  final bool isOtherPage;

  @override
  Widget build(BuildContext context) => Container(
        padding:
            const EdgeInsets.only(left: 16, top: 12, bottom: 12, right: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).extension<WTextFieldStyle>()!.fillColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context)
                .extension<ThemedColors>()!
                .solitudeToDarkRider,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                region.isEmpty ? LocaleKeys.choose_region.tr() : region,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: region.isEmpty
                        ? grey
                        : Theme.of(context)
                            .extension<ThemedColors>()!
                            .midnightExpressToWhite),
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(icon,
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .darkGreyToWhite),
          ],
        ),
      );
}
