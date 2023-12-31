import 'dart:async';

// ignore: directives_ordering
import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/widgets/notification_button.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/comparison/presentation/comparison_page.dart';
import 'package:auto/features/dealers/presentation/dealers_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/domain/entities/profile_data_entity.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/pages.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ImageBloc imageBloc;

  @override
  void initState() {
    imageBloc = ImageBloc();
    super.initState();
  }

  late ProfileDataEntity profileData;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
            filledBackButton: true,
            boxShadow: const [
              BoxShadow(offset: Offset(0, 0), blurRadius: 0, color: white),
            ],
            extraActions:   [NotificationButton()],
            hasBackButton: false,
            textWithButton: LocaleKeys.my_profile.tr()),
        body: BlocConsumer<WishlistAddBloc, WishlistAddState>(
          listener: (context, stateWish) {
            if (stateWish.addStatus.isSubmissionSuccess) {
              context
                  .read<ProfileBloc>()
                  .add(ChangeCountDataEvent(adding: true, favoritesCount: 1));
            }
            if (stateWish.removeStatus.isSubmissionSuccess) {
              context
                  .read<ProfileBloc>()
                  .add(ChangeCountDataEvent(adding: false, favoritesCount: 1));
            }
          },
          builder: (context, stateWish) =>
              BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state.changeStatus.isSubmissionSuccess) {
                profileData = state.profileEntity;
              }
            },
            builder: (context, state) {
              if (state.status.isSubmissionInProgress ||
                  stateWish.goToAds == 1) {
                Timer(
                  const Duration(milliseconds: 500),
                  () async {
                    if (context.read<WishlistAddBloc>().state.goToAds == 1) {
                      await Navigator.of(context)
                          .push(fade(page: const MyAdsPage()))
                          .then((value) => context
                              .read<WishlistAddBloc>()
                              .add(WishlistAddEvent.goToAdds(-1)));
                    }
                  },
                );
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state.status.isSubmissionSuccess ||
                  state.status.isSubmissionFailure) {
                profileData = state.profileEntity;
                // ignore: prefer_final_locals
                var usercountData = profileData.usercountdata;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        ProfileDataWidget(
                            onTap: () {
                              Navigator.of(context).push(fade(
                                  page: SeeProfilePage(imageBloc: imageBloc)));
                            },
                            fullName: profileData.fullName ?? '',
                            subTitle: usercountData.announcementsCount == 0
                                ? LocaleKeys.no_ads.tr()
                                : LocaleKeys.how_many_ads.tr(args: [
                                    '${usercountData.announcementsCount}'
                                  ], namedArgs: {
                                    'appendix': MyFunctions.getAppendix(
                                        usercountData.announcementsCount)
                                  }),
                            imageUrl: profileData.image ?? '',
                            margin: const EdgeInsets.only(top: 16, bottom: 12)),
                        // izbrannoe va sravnenie
                        ProfilItemsBox(widgets: [
                          ProfileMenuTile(
                              name: LocaleKeys.favorites.tr(),
                              onTap: () {
                                Navigator.push(
                                    context, fade(page: const FavouritePage()));
                              },
                              iconPath: AppIcons.heartBlue,
                              count: usercountData.announcementWishlistCount),
                          const ProfileDivider(),
                          ProfileMenuTile(
                              name: LocaleKeys.comparisons.tr(),
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(fade(page: const ComparisonPage()));
                              },
                              iconPath: AppIcons.scales),
                        ]),

                        // moi obnovleniya
                        ProfilItemsBox(marginTop: 12, widgets: [
                          ProfileMenuTile(
                              name: LocaleKeys.my_ads.tr(),
                              onTap: () {
                                Navigator.of(context)
                                    .push(fade(page: const MyAdsPage()));
                              },
                              iconPath: AppIcons.tabletNews,
                              count: usercountData.announcementsCount),
                          const ProfileDivider(),
                          ProfileMenuTile(
                              name: LocaleKeys.my_searchs.tr(),
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(fade(page: const MySearchesPage()));
                              },
                              iconPath: AppIcons.mySearch,
                              count: state.profileEntity.usercountdata
                                  .filterHistoryCount),
                          const ProfileDivider(),
                        ]),

                        //Дилеры - Справочник - Чат
                        ProfilItemsBox(marginTop: 12, widgets: [
                          ProfileMenuTile(
                              name: LocaleKeys.dealers.tr(),
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(fade(page: const DealerScreen()));
                              },
                              iconPath: AppIcons.dealers),
                          const ProfileDivider(),
                          ProfileMenuTile(
                              name: LocaleKeys.directory.tr(),
                              onTap: () {
                                Navigator.of(context)
                                    .push(fade(page: const DirectoryPage()));
                              },
                              iconPath: AppIcons.direct),
                          const ProfileDivider(),
                          ProfileMenuTile(
                              name: LocaleKeys.chat.tr(),
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  fade(
                                      page: ChatPage(
                                          phone:
                                              state.profileEntity.phoneNumber ??
                                                  '',
                                          userName: state
                                                  .profileEntity.fullName ??
                                              state.profileEntity.firstName ??
                                              '')),
                                );
                              },
                              iconPath: AppIcons.message),
                          const ProfileDivider(),
                          ProfileMenuTile(
                              name: LocaleKeys.settings.tr(),
                              onTap: () {
                                Navigator.of(context)
                                    .push(
                                  fade(page: const SettingsPage()),
                                )
                                    .then((value) {
                                  setState(() {});
                                });
                              },
                              iconPath: AppIcons.settings),
                        ]),
                        //
                        ProfilItemsBox(
                            marginBottom: 20,
                            marginTop: 12,
                            widgets: [
                              ProfileMenuTile(
                                  name: LocaleKeys.about_app.tr(),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        fade(page: const AboutAppScreen()));
                                  },
                                  iconPath: AppIcons.info),
                            ]),
                      ],
                    ),
                  ),
                );
              }
              return const Center(child: Text('xatolik'));
            },
          ),
        ),
      );
}
