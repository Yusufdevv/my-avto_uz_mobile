import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/features/common/widgets/cached_image.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/domain/entities/profile_entity.dart';
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
          margin: EdgeInsets.only(top: SizeConfig.v(16)),
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.v(24), horizontal: SizeConfig.h(16)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeConfig.h(20)),
                topRight: Radius.circular(SizeConfig.h(20)),
              ),
              color: Theme.of(context).appBarTheme.backgroundColor),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(width: SizeConfig.h(44)),
                  Center(
                    child: CachedImage(
                      width: SizeConfig.h(80),
                      height: SizeConfig.v(80),
                      borderRadius: BorderRadius.circular(SizeConfig.h(40)),
                      border: Border.all(color: borderCircular),
                      fit: BoxFit.cover,
                      imageUrl: profileEntity.image,
                    ),
                  ),
                  const Spacer(),
                  WScaleAnimation(
                    child: Container(
                        padding: EdgeInsets.all(SizeConfig.h(10)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SizeConfig.h(8)),
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .borderGreyToDark,
                        ),
                        child: SvgPicture.asset(AppIcons.edit,
                            height: SizeConfig.v(24),
                            width: SizeConfig.h(24),
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .darkGreyToWhite)),
                    onTap: () {
                      Navigator.of(context).push(
                        fade(
                          page: ProfileEditScreen(
                              profileBloc: profileBloc, imageBloc: imageBloc),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.v(16), bottom: SizeConfig.v(2)),
                child: Text(
                    profileEntity.firstName.isEmpty
                        ? 'No name'
                        : profileEntity.fullName,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18)),
              ),
              Text('0 ${LocaleKeys.how_many_ads.tr()}',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.w600, color: grey)),
              TextSpacer(
                title: LocaleKeys.tel_number.tr(),
                value: profileBloc.state.phoneNumber.isNotEmpty
                    ? profileBloc.state.phoneNumber
                    : profileEntity.phoneNumber,
                padding: EdgeInsets.only(
                    top: SizeConfig.v(36), bottom: SizeConfig.v(16)),
              ),
              TextSpacer(
                title: LocaleKeys.region.tr(),
                value: 'profileEntity.region.toString()',
                padding: EdgeInsets.only(bottom: SizeConfig.v(16)),
              ),
              TextSpacer(title: 'Email', value: profileEntity.email),
              const Spacer(),
              OrangeButton(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.logout),
                    SizedBox(width: SizeConfig.h(8)),
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
