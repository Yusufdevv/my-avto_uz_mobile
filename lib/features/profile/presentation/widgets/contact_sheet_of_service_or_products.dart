import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactSheetOfServiceOrProduct extends StatelessWidget {
  const ContactSheetOfServiceOrProduct({
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);
  final String phoneNumber;

  @override
  Widget build(BuildContext context) => Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          color: Theme.of(context).extension<ThemedColors>()!.whiteToBlack,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.phoneCall1),
                const SizedBox(width: 12),
                Text(
                  MyFunctions.phoneFormat(phoneNumber),
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            WButton(
              color: emerald,
              shadow: [
                BoxShadow(
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                  color: orange.withOpacity(0.2),
                ),
              ],
              margin: const EdgeInsets.only(top: 20),
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                LocaleKeys.call.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
}
