import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({required this.phone, Key? key}) : super(key: key);
  final String phone;

  @override
  Widget build(BuildContext context) => WAppBar(
        height: 67,
        childWithButton: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.autoUzCircle),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.help_desk.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  '24/7',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: hoursGreen),
                ),
              ],
            ),
          ],
        ),
        child: WScaleAnimation(
          onTap: () {
            launchUrl(Uri.parse('tel://$phone'));
          },
          child: Container(
            margin: const EdgeInsets.only(right: 16, top: 11),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color:
                  Theme.of(context).extension<ThemedColors>()!.greyToDarkRider,
            ),
            child: SvgPicture.asset(AppIcons.phoneCall),
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
