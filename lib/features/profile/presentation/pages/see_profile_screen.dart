import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/profile_edit_screen.dart';
import 'package:auto/features/profile/presentation/widgets/text_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SeeProfileScreen extends StatelessWidget {
  const SeeProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          textWithButton: 'Мой профиль',
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Theme.of(context).appBarTheme.backgroundColor),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const SizedBox(width: 44),
                  Center(
                    child: CachedImage(
                        height: 80,
                        width: 80,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: borderCircular),
                        fit: BoxFit.cover,
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_mNmpqHOTakNgIaKR5bxJFfkUtiLdPBXPMw&usqp=CAU'),
                  ),
                  const Spacer(),
                  WScaleAnimation(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .borderGreyToDark,
                      ),
                      child: SvgPicture.asset(
                        AppIcons.edit,
                        height: 24,
                        width: 24,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .iconPearlToWhite,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        fade(
                          page: const EditProfileScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 2),
                child: Text(
                  'Шохрух Бахтияров',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18),
                ),
              ),
              Text(
                '0 объявлений',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontWeight: FontWeight.w600, color: grey),
              ),
              const TextSpacer(
                title: 'Телефон номер',
                value: '+998 88 033 18 05',
                padding: EdgeInsets.only(top: 36, bottom: 16),
              ),
              const TextSpacer(
                title: 'Регион',
                value: 'г. Ташкент',
                padding: EdgeInsets.only(bottom: 16),
              ),
              const TextSpacer(title: 'Email', value: 'boss@auto.uz'),
            ],
          ),
        ),
      );
}
/**/
