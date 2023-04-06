import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarSingleResendBtn extends StatelessWidget {
  final VoidCallback onTap;

  const CarSingleResendBtn({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WButton(
        border: Border.all(color: yellowSea.withOpacity(0.48)),
        width: double.maxFinite,
        onTap: onTap,
        color: floralWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.refresh1),
            const SizedBox(width: 8),
            Text(
              LocaleKeys.resend.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: yellowSea, fontSize: 15, height: 1.3),
            )
          ],
        ),
      );
}
