import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OfferBadge extends StatelessWidget {
  const OfferBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WButton(
        onTap: () {},
        height: 28,
        borderRadius: 6,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        gradient: const LinearGradient(colors: [orangeLight, orangeMid]),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Text(
              LocaleKeys.deals_of_day.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 14),
            ),
            SvgPicture.asset(
              AppIcons.flash,
              color: white,
            ),
          ],
        ),
      );
}
