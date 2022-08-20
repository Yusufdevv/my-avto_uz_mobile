import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/onboarding/presentation/widgets/social_media_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseOnBoarding extends StatelessWidget {
  final Color color;
  const BaseOnBoarding({required this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            WButton(
              onTap: () => Navigator.pushAndRemoveUntil(context, fade(page: const HomeScreen()), (route) => false),
              text: 'Войти в систему',
              color: color,
              borderRadius: 8,
            ),
            const SizedBox(
              height: 8,
            ),
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
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Другие способы входа',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14),
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
              children:  [
                SocialMediaItem(icon: SvgPicture.asset(AppIcons.facebook, color: Theme.of(context).extension<ThemedColors>()!.dodgerBlueToWhite80,)),
                const SizedBox(
                  width: 24,
                ),
                SocialMediaItem(icon: SvgPicture.asset(AppIcons.google),),
                const SizedBox(
                  width: 24,
                ),
                SocialMediaItem(icon: SvgPicture.asset(AppIcons.apple, color: Theme.of(context).extension<ThemedColors>()!.blackToWhite80,)),
                const SizedBox(
                  width: 24,
                ),
                SocialMediaItem(icon: SvgPicture.asset(AppIcons.imkon, color: Theme.of(context).extension<ThemedColors>()!.prussianBlueToWhite80,)),
              ],
            )
          ],
        ),
      );
}
