import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/profile/presentation/widgets/rate.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar:  WAppBar(
          textWithButton: LocaleKeys.about_app.tr(),
        ),
        body: Column(
          children: [
            WScaleAnimation(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context)
                          .extension<WTextFieldStyle>()!
                          .borderColor),
                  borderRadius: BorderRadius.circular(12),
                  color:
                      Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.file,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .darkToGrey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      LocaleKeys.terms_use.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            const Rate(),
            const Spacer(),
            SvgPicture.asset(
              Theme.of(context).extension<ThemedIcons>()!.autoUzLightDark,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 36),
              child: Text(
                'Версия 1.1\nот 1 апреля 2022 г.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            )
          ],
        ),
      );
}
