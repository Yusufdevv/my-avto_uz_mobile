import 'package:auto/core/singletons/storage.dart';
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
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
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
      profileFavoritesUseCase: ProfileFavoritesUseCase(repository: repo),
      getTermsOfUseUseCase: GetTermsOfUseUseCase(repository: repo),
    )..add(GetProfileEvent());
    imageBloc = ImageBloc();
    print(StorageRepository.getString('token'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: profileBloc,
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.status.isSubmissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state.status.isSubmissionFailure) {
              return const Center(child: Text('Fail'));
            } else if (state.status.isSubmissionSuccess) {
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
                          child: SvgPicture.asset(
                            AppIcons.bellWithCircle,
                          ),
                        ),
                      )
                    ],
                    hasBackButton: false,
                    textWithButton: LocaleKeys.my_profile.tr()),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.h(16)),
                    child: Column(
                      children: [
                        ProfileDataWidget(
                          onTap: () {
                            print(StorageRepository.getString('token'));
                            Navigator.of(context).push(fade(
                                page: SeeProfilePage(
                              profileBloc: profileBloc,
                              imageBloc: imageBloc,
                            )));
                          },
                          title: state.profileEntity.fullName ?? '',
                          subTitle:
                              '${state.profileEntity.usercountdata?.announcementsCount ?? 0} ${LocaleKeys.how_many_ads.tr()}',
                          imageUrl: state.profileEntity.image ?? '',
                          margin: EdgeInsets.only(
                              top: SizeConfig.v(16), bottom: SizeConfig.v(12)),
                        ),

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
                              count: state.profileEntity.usercountdata
                                  ?.announcementWishlistCount),
                          const ProfileDivider(),
                          ProfileMenuTile(
                            name: LocaleKeys.comparisons.tr(),
                            onTap: () {
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(fade(page: const ComparisonPage()));
                            },
                            iconPath: AppIcons.scales,
                          ),
                        ]),

                        // moi obnovleniya
                        ProfilItemsBox(marginTop: SizeConfig.v(12), widgets: [
                          ProfileMenuTile(
                              name: LocaleKeys.my_ads.tr(),
                              onTap: () {
                                Navigator.of(context).push(fade(
                                    page:
                                        MyAddsPage(profileBloc: profileBloc)));
                              },
                              iconPath: AppIcons.tabletNews,
                              count: state.profileEntity.usercountdata
                                  ?.announcementsCount),
                          const ProfileDivider(),
                          ProfileMenuTile(
                              name: 'Мои поиски',
                              onTap: () {
                                Navigator.push(context,
                                    fade(page: const MySearchesPage()));
                              },
                              iconPath: AppIcons.mySearch,
                              count: state
                                  .profileEntity.usercountdata?.searchCount),
                          const ProfileDivider(),
                          ProfileMenuTile(
                              name: 'Мои отзывы',
                              onTap: () {
                                Navigator.of(context)
                                    .push(fade(page: const ReviewsScreen()));
                              },
                              iconPath: AppIcons.message,
                              count: state
                                  .profileEntity.usercountdata?.reviewsCount),
                        ]),

                        //
                        ProfilItemsBox(marginTop: SizeConfig.v(12), widgets: [
                          ProfileMenuTile(
                            name: 'Дилеры',
                            onTap: () {
                              Navigator.of(context)
                                  .push(fade(page: const DealerScreen()));
                            },
                            iconPath: AppIcons.dealers,
                          ),
                          const ProfileDivider(),
                          ProfileMenuTile(
                              name: 'Справочник',
                              onTap: () {
                                Navigator.of(context).push(fade(
                                    page: const DealerScreen(
                                  isDirectoryPage: true,
                                )));
                              },
                              iconPath: AppIcons.direct),
                          const ProfileDivider(),
                          ProfileMenuTile(
                              name: 'Чат',
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                    fade(
                                        page: ChatPage(
                                            hasChat: false,
                                            imageBloc: imageBloc)));
                              },
                              iconPath: AppIcons.message),
                          const ProfileDivider(),
                          ProfileMenuTile(
                              name: LocaleKeys.settings.tr(),
                              onTap: () {
                                Navigator.of(context).push(
                                  fade(
                                      page: SettingsPage(
                                          profileBloc: profileBloc)),
                                );
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
                                        profileBloc: profileBloc,
                                      ),
                                    ));
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
      );
}

// Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(12),
                    //       color: iconBackground),
                    //   margin: const EdgeInsets.only(bottom: 12),
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 12),
                    //   child: Text(
                    //     LocaleKeys.number_dont_regist.tr(),
                    //     textAlign: TextAlign.center,
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .headline4!
                    //         .copyWith(fontSize: 12),
                    //   ),
                    // ),