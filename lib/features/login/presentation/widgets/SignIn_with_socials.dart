import 'package:auto/assets/colors/dark.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/features/onboarding/presentation/widgets/social_media_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class SignInWithSocials extends StatelessWidget {
  const SignInWithSocials({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                  thickness: 1,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .solitudeToDarkGray95),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              LocaleKeys.another_ways.tr(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14, color: DarkThemeColors.navBarUnselected),
            ),
            const SizedBox(
              width: 4,
            ),
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
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SocialMediaItem(icon: SvgPicture.asset(AppIcons.facebook, color: Theme.of(context).extension<ThemedColors>()!.dodgerBlueToWhite80,)),
            // const SizedBox(
            //   width: 24,
            // ),
            SocialMediaItem(
              icon: SvgPicture.asset(
                  Theme.of(context).extension<ThemedIcons>()!.google),
            ),
            const SizedBox(
              width: 24,
            ),
            SocialMediaItem(
                icon: SvgPicture.asset(
                  AppIcons.apple,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .blackToWhite80,
                )),
            const SizedBox(
              width: 24,
            ),
            SocialMediaItem(
                icon: SvgPicture.asset(
                  AppIcons.imkon,
                  color: Theme.of(context)
                      .extension<ThemedColors>()!
                      .prussianBlueToWhite80,
                )),
          ],
        ),
      ],
    );
}