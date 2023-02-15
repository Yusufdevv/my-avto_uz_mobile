import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/onboarding/presentation/widgets/social_media_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseOnBoarding extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const BaseOnBoarding({required this.onTap, required this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            WButton(
              onTap: onTap,
              text: LocaleKeys.enter_to_system.tr(),
              color: color,
              borderRadius: 8,
              shadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                    color: solitude.withOpacity(.12)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToDarkGray95,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  LocaleKeys.another_ways.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: greyText),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToDarkGray95,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaItem(
                    onTap: () {},
                    icon: SvgPicture.asset(
                  AppIcons.facebook,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .dodgerBlueToWhite80,
                )),
                const SizedBox(width: 24),
                SocialMediaItem(
                  onTap: () {},
                  icon: SvgPicture.asset(
                      Theme.of(context).extension<ThemedIcons>()!.google),
                ),
                const SizedBox(width: 24),
                SocialMediaItem(
                    onTap: () {},
                    icon: SvgPicture.asset(
                  AppIcons.apple,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .blackToWhite80,
                )),
                const SizedBox(width: 24),
                SocialMediaItem(
                    onTap: () {},
                    icon: SvgPicture.asset(
                  AppIcons.imkon,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .prussianBlueToWhite80,
                )),
              ],
            ),
            const SizedBox(height: 24)
          ],
        ),
      );
}
