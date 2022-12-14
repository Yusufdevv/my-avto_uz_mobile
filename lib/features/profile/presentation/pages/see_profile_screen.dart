import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/domain/entities/profile.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/profile_edit_screen.dart';
import 'package:auto/features/profile/presentation/widgets/log_out_bottomsheet.dart';
import 'package:auto/features/profile/presentation/widgets/text_spacer.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SeeProfileScreen extends StatelessWidget {
  final ProfileEntity profileEntity;
  final ProfileBloc profileBloc;
  final ImageBloc imageBloc;

  const SeeProfileScreen({
    required this.profileEntity,
    required this.profileBloc,
    required this.imageBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          textWithButton: LocaleKeys.my_profile.tr(),
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
                          'https://images.unsplash.com/photo-1667860920650-d23d24c0e4de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                    ),
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
                            .darkGreyToWhite,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        fade(
                          page: EditProfileScreen(
                            profileBloc: profileBloc,
                            imageBloc: imageBloc,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 2),
                child: Text(
                  "Ali xl",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18),
                ),
              ),
              Text(
                '0 ' + LocaleKeys.how_many_ads.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontWeight: FontWeight.w600, color: grey),
              ),
              TextSpacer(
                title: "LocaleKeys.tel_number.tr()",
                value: profileEntity.phoneNumber,
                padding: const EdgeInsets.only(top: 36, bottom: 16),
              ),
              TextSpacer(
                title: LocaleKeys.region.tr(),
                value: 'г. Ташкент',
                padding: const EdgeInsets.only(bottom: 16),
              ),
              TextSpacer(title: 'Email', value: profileEntity.email),
              const Spacer(),
              OrangeButton(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.logout),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Выйти из аккаунта',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: red),
                    ),
                  ],
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width),
                      builder: (context) => const LogoOutBottomsheet());
                },
                color: red.withOpacity(0.1),
                shadowColor: white,
              )
            ],
          ),
        ),
      );
}
/**/
