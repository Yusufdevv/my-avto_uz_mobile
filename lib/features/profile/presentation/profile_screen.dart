import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/repository/auth.dart';
import 'package:auto/features/comparison/presentation/comparison_page.dart';
import 'package:auto/features/profile/domain/entities/profile_data_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

// ignore: directives_ordering
import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/dealers/presentation/dealers_main.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:auto/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:auto/features/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_terms_of_use_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profile_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/pages.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/features/reviews/presentation/reviews_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc profileBloc;
  late ImageBloc imageBloc;

  @override
  void initState() {
    final repo = serviceLocator<ProfileRepositoryImpl>();
    profileBloc = ProfileBloc(
        changePasswordUseCase: ChangePasswordUseCase(repository: repo),
        editProfileUseCase: EditProfileUseCase(repository: repo),
        profileUseCase: ProfileUseCase(repository: repo),
        getTermsOfUseUseCase: GetTermsOfUseUseCase(repository: repo),
        repository: AuthRepository())
      ..add(GetProfileEvent());
    imageBloc = ImageBloc();
    print('=======profile isread ${context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .user
                                    .isReadAllNotifications}');
    super.initState();
  }

  late ProfileDataEntity profileData;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: profileBloc,
        child: BlocListener<WishlistAddBloc, WishlistAddState>(
          listener: (context, stateWish) {
            if (stateWish.addStatus.isSubmissionSuccess) {
              profileBloc.add(ChangeCountDataEvent(adding: true));
            }
            if (stateWish.removeStatus.isSubmissionSuccess) {
              profileBloc.add(ChangeCountDataEvent(adding: false));
            }
          },
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state.changeStatus.isSubmissionSuccess) {
                profileData = state.profileEntity;
              }
            },
            builder: (context, state) {
              if (state.status.isSubmissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state.status.isSubmissionFailure) {
                return const Center(child: Text('Fail'));
              } else if (state.status.isSubmissionSuccess) {
                profileData = state.profileEntity;
                // ignore: prefer_final_locals
                var usercountData = profileData.usercountdata;
                return Scaffold(
                  appBar: WAppBar(
                      filledBackButton: true,
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 0), blurRadius: 0, color: white),
                      ],
                      extraActions: [
                        Padding(
                          padding: EdgeInsets.only(right: SizeConfig.h(16)),
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.of(context, rootNavigator: true)
                                    .push(fade(page: const NotificationPage())),
                            child: SvgPicture.asset(context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .user
                                    .isReadAllNotifications
                                ? AppIcons.bell
                                : AppIcons.bellWithCircle),
                          ),
                        )
                      ],
                      hasBackButton: false,
                      textWithButton: LocaleKeys.my_profile.tr()),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: SizeConfig.h(16)),
                      child: Column(
                        children: [
                          ProfileDataWidget(
                              onTap: () {
                                Navigator.of(context).push(fade(
                                    page: SeeProfilePage(
                                        profileBloc: profileBloc,
                                        imageBloc: imageBloc)));
                              },
                              fullName: profileData.fullName ?? '',
                              subTitle:
                                  '${usercountData.announcementsCount} ${LocaleKeys.how_many_ads.tr()}',
                              imageUrl: profileData.image ?? '',
                              margin: EdgeInsets.only(
                                  top: SizeConfig.v(16),
                                  bottom: SizeConfig.v(12))),
                          // izbrannoe va sravnenie
                          ProfilItemsBox(widgets: [
                            ProfileMenuTile(
                                name: LocaleKeys.favorites.tr(),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      fade(
                                          page: FavouritePage(
                                              profileBloc: profileBloc)));
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
                          ProfilItemsBox(marginTop: SizeConfig.v(12), widgets: [
                            ProfileMenuTile(
                                name: LocaleKeys.my_ads.tr(),
                                onTap: () {
                                  Navigator.of(context)
                                      .push(fade(page: const MyAddsPage()));
                                },
                                iconPath: AppIcons.tabletNews,
                                count: usercountData.announcementsCount),
                            const ProfileDivider(),
                            ProfileMenuTile(
                                name: 'Мои поиски',
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(fade(page: const MySearchesPage()));
                                },
                                iconPath: AppIcons.mySearch,
                                count: state.profileEntity.usercountdata
                                    .filterHistoryCount),
                            const ProfileDivider(),
                            // ProfileMenuTile(
                            //     name: 'Мои отзывы',
                            //     onTap: () {
                            //       Navigator.of(context)
                            //           .push(fade(page: const ReviewsScreen()));
                            //     },
                            //     iconPath: AppIcons.message,
                            //     count: state
                            //         .profileEntity.usercountdata.reviewsCount),
                          ]),

                          //Дилеры - Справочник - Чат
                          ProfilItemsBox(marginTop: SizeConfig.v(12), widgets: [
                            ProfileMenuTile(
                                name: 'Дилеры',
                                onTap: () {
                                  Navigator.of(context)
                                      .push(fade(page: const DealerScreen()));
                                },
                                iconPath: AppIcons.dealers),
                            const ProfileDivider(),
                            ProfileMenuTile(
                                name: 'Справочник',
                                onTap: () {
                                  Navigator.of(context)
                                      .push(fade(page: const DirectoryPage()));
                                },
                                iconPath: AppIcons.direct),
                            const ProfileDivider(),
                            ProfileMenuTile(
                                name: 'Чат',
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                    fade(
                                        page: ChatPage(
                                            phone: state.profileEntity
                                                    .phoneNumber ??
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
                                    fade(
                                        page: SettingsPage(
                                            profileBloc: profileBloc)),
                                  )
                                      .then((value) {
                                    setState(() {});
                                  });
                                },
                                iconPath: AppIcons.settings),
                          ]),
                          //
                          ProfilItemsBox(
                              marginBottom: SizeConfig.v(20),
                              marginTop: SizeConfig.v(12),
                              widgets: [
                                ProfileMenuTile(
                                    name: LocaleKeys.about_app.tr(),
                                    onTap: () {
                                      Navigator.of(context).push(fade(
                                          page: AboutAppScreen(
                                              profileBloc: profileBloc)));
                                    },
                                    iconPath: AppIcons.info),
                              ]),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return const Center(child: CupertinoActivityIndicator());
            },
          ),
        ),
      );
}
