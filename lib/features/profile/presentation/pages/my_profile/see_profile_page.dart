import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/login/presentation/login_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/my_profile/profile_edit_page.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

class SeeProfilePage extends StatelessWidget {
  final ImageBloc imageBloc;

  const SeeProfilePage({
    required this.imageBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomScreen(
        child: Scaffold(
          appBar: WAppBar(
            textWithButton: LocaleKeys.my_profile.tr(),
          ),
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.status.isSubmissionSuccess ||
                  state.status.isSubmissionFailure) {
                return Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(
                      vertical: 24, horizontal: 16),
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl: state.profileEntity.image ?? '',
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => SizedBox(
                                  width: 90,
                                  height: 90,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(AppImages.defaultPhoto,
                                          fit: BoxFit.cover))),
                            ),
                          ),
                          const Spacer(),
                          WScaleAnimation(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(10),
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .borderGreyToDark,
                                ),
                                child: SvgPicture.asset(AppIcons.edit,
                                    height: 24,
                                    width: 24,
                                    color: Theme.of(context)
                                        .extension<ThemedColors>()!
                                        .darkGreyToWhite)),
                            onTap: () {
                              Navigator.of(context).push(
                                fade(
                                    page:
                                        ProfileEditPage(imageBloc: imageBloc)),
                              );
                            },
                          ),
                        ],
                      ),
                      if(state.profileEntity.fullName!=null)
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, bottom: 2),
                        child: Text(state.profileEntity.fullName ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 18)),
                      ),
                      if(state.profileEntity.fullName==null)
                        const SizedBox(height: 8),
                      Text(
                          state.profileEntity.usercountdata
                                      .announcementsCount ==
                                  0
                              ? LocaleKeys.no_ads.tr()
                              : '${state.profileEntity.usercountdata.announcementsCount} ${LocaleKeys.how_many_ads.tr(args: [
                                      '${state.profileEntity.usercountdata.announcementsCount}'
                                    ], namedArgs: {
                                      'appendix': MyFunctions.getAppendix(state
                                          .profileEntity
                                          .usercountdata
                                          .announcementsCount)
                                    })}',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600, color: grey)),
                      TextSpacer(
                        title: LocaleKeys.tel_number.tr(),
                        value: state.profileEntity.phoneNumber ?? '',
                        padding: const EdgeInsets.only(
                            top: 36, bottom: 16),
                      ),
                      if(state.profileEntity.region?.title!=null)
                      TextSpacer(
                        title: LocaleKeys.region.tr(),
                        value: state.profileEntity.region?.title ?? '',
                        padding: const EdgeInsets.only(bottom: 16),
                      ),
                      if(state.profileEntity.email!= '')
                        TextSpacer(
                          title: LocaleKeys.email.tr(),
                          value: state.profileEntity.email ?? ''),
                      const Spacer(),
                      OrangeButton(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.logout),
                              const SizedBox(width: 8),
                              Text(LocaleKeys.exit_from_account.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: red))
                            ],
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                useRootNavigator: true,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => CustomProfileBottomsheet(
                                      title: LocaleKeys
                                          .do_you_really_want_to_leave
                                          .tr(),
                                      subTitle: LocaleKeys
                                          .after_exiting_the_application
                                          .tr(),
                                      betweenHeight: 64,
                                      onTap: () {
                                        StorageRepository.deleteString('token');
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pushAndRemoveUntil(
                                                fade(page: const LoginScreen()),
                                                (route) => false);
                                      },
                                    ));
                          },
                          color: red.withOpacity(0.1),
                          shadowColor: white)
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      );
}
/**/
