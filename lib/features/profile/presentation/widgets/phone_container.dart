import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneContainer extends StatelessWidget {
  const PhoneContainer({
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4, right: 4),
        decoration: BoxDecoration(
            color: phoneNumber.isEmpty
                ? orange.withOpacity(0.1)
                : Theme.of(context).extension<WTextFieldStyle>()!.fillColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Theme.of(context)
                    .extension<WTextFieldStyle>()!
                    .borderColor)),
        child: Row(
          children: [
            Text(
              phoneNumber.isEmpty
                  ? LocaleKeys.add_phone_number.tr()
                  : phoneNumber,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Container(
                padding: EdgeInsets.all(phoneNumber.isEmpty ? 6 : 8),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 20,
                        color: dividerColor.withOpacity(0.2))
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: phoneNumber.isEmpty
                      ? orange
                      : Theme.of(context)
                          .extension<ThemedColors>()!
                          .borderGreyToDark,
                ),
                child: phoneNumber.isEmpty
                    ? SvgPicture.asset(AppIcons.plusMini,
                        height: 24, width: 24, color: white)
                    : SvgPicture.asset(AppIcons.edit,
                        height: 20,
                        width: 20,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .darkGreyToWhite)),
          ],
        ),
      );
}
