import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DealButton extends StatelessWidget {
  const DealButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => WButton(
        height: 52,
        onTap: onTap,
        borderRadius: 12,
        color: purple,
        border: Border.all(width: 1, color: white.withOpacity(0.84)),
        shadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 24,
              color: blueGem.withOpacity(0.35)),
        ],
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SvgPicture.asset(
                  AppIcons.backgroundIcon,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              right: 28,
              child: ClipRRect(child: SvgPicture.asset(AppIcons.videoIcon)),
            ),
            Positioned(
              left: 20,
              top: 14,
              bottom: 14,
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.flash),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    LocaleKeys.deals_of_day.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
