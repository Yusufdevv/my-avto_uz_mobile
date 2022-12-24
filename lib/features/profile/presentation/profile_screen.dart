import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/comparison/presentation/comparison_page.dart';
import 'package:auto/features/dealers/presentation/dealers_main.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:auto/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:auto/features/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profile_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/about_app_screen.dart';
import 'package:auto/features/profile/presentation/pages/chat.dart';
import 'package:auto/features/profile/presentation/pages/directory_page.dart';
import 'package:auto/features/profile/presentation/pages/my_ad_screen.dart';
import 'package:auto/features/profile/presentation/pages/my_searches_page.dart';
import 'package:auto/features/profile/presentation/pages/see_profile_screen.dart';
import 'package:auto/features/profile/presentation/pages/settings_screen.dart';
import 'package:auto/features/profile/presentation/widgets/profil_items_box.dart';
import 'package:auto/features/profile/presentation/widgets/profile_data.dart';
import 'package:auto/features/profile/presentation/widgets/profile_divider.dart';
import 'package:auto/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:auto/features/reviews/presentation/reviews_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        changePasswordUseCase: ChangePasswordUseCase(
            repository: repo),
        editProfileUseCase: EditProfileUseCase(
            repository: repo),
        profileUseCase:
            ProfileUseCase(repository: repo),
        profileFavoritesUseCase: ProfileFavoritesUseCase(
            repository: repo),
            )
      ..add(GetProfileEvent())
      ..add(GetProfileFavoritesEvent());
    imageBloc = ImageBloc();
    super.initState();
  }

  @override
  void dispose() {
    profileBloc.close();
    imageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: profileBloc,
        child:
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          // print(state.status);
          // if (state.status.isPure) {
          //   context.read<ProfileBloc>().add(GetProfileEvent());
          // } else if (state.status.isSubmissionFailure) {
          //   return const Center(child: CupertinoActivityIndicator());
          // } else if (state.status.isSubmissionFailure) {
          //   return const Center(child: Text("Fail"));
          // } else if (state.status.isSubmissionFailure) {
          print("Bearer ${StorageRepository.getString('token')}");
          print(state.profileEntity.image);
          return Scaffold(
            appBar: WAppBar(
              filledBackButton: true,
              boxShadow: const [
                BoxShadow(offset: Offset(0, 0), blurRadius: 0, color: white),
              ],
              hasBackButton: false,
              textWithButton: LocaleKeys.my_profile.tr(),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.h(16)),
                child: Column(
                  children: [
                    ProfileData(
                      onTap: () {
                        Navigator.of(context).push(
                          fade(
                            page: SeeProfileScreen(
                              profileEntity: state.profileEntity,
                              profileBloc: profileBloc,
                              imageBloc: imageBloc,
                            ),
                          ),
                        );
                      },
                      title: state.profileEntity.fullName,
                      subTitle: '0 ${LocaleKeys.how_many_ads.tr()}',
                      imageUrl: state.profileEntity.image,
                      margin: EdgeInsets.only(
                        top: SizeConfig.v(16),
                        bottom: SizeConfig.v(12),
                      ),
                    ),
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

                    // izbrannoe va sravnenie
                    ProfilItemsBox(
                      widgets: [
                        ProfileMenuTile(
                            name: LocaleKeys.favorites.tr(),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  fade(
                                      page: FavouritePage(
                                    favoriteEntity: state.favoriteEntity,
                                  )));
                            },
                            iconPath: AppIcons.heartBlue,
                            count: 37),
                        const ProfileDivider(),
                        ProfileMenuTile(
                          name: LocaleKeys.comparisons.tr(),
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                              fade(
                                page: const ComparisonPage(),
                              ),
                            );
                          },
                          iconPath: AppIcons.scales,
                          count: 54,
                        ),
                      ],
                    ),

                    // moi obnovleniya
                    ProfilItemsBox(
                      marginTop: SizeConfig.v(12),
                      widgets: [
                        ProfileMenuTile(
                            name: LocaleKeys.my_ads.tr(),
                            onTap: () {
                              Navigator.of(context)
                                  .push(fade(page: const MyAdScreen()));
                            },
                            iconPath: AppIcons.tabletNews,
                            count: 23),
                        const ProfileDivider(),
                        ProfileMenuTile(
                            name: 'Мои поиски',
                            onTap: () {},
                            iconPath: AppIcons.mySearch,
                            count: 23),
                        const ProfileDivider(),
                        ProfileMenuTile(
                            name: 'Мои отзывы',
                            onTap: () {
                              Navigator.of(context).push(
                                fade(
                                  page: const ReviewsScreen(),
                                ),
                              );
                            },
                            iconPath: AppIcons.message,
                            count: 64),
                      ],
                    ),
                    ProfilItemsBox(
                      marginTop: SizeConfig.v(12),
                      widgets: [
                        ProfileMenuTile(
                            name: 'Дилеры',
                            onTap: () {
                              Navigator.of(context).push(
                                fade(page: const DealerScreen()),
                              );
                            },
                            iconPath: AppIcons.dealers,
                            count: 23),
                        const ProfileDivider(),
                        ProfileMenuTile(
                            name: 'Справочник',
                            onTap: () {},
                            iconPath: AppIcons.direct),
                        const ProfileDivider(),
                        ProfileMenuTile(
                          name: 'Чат',
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                              fade(
                                page:
                                    Chat(hasChat: false, imageBloc: imageBloc),
                              ),
                            );
                          },
                          iconPath: AppIcons.message,
                        ),
                        const ProfileDivider(),
                        ProfileMenuTile(
                          name: LocaleKeys.settings.tr(),
                          onTap: () {
                            Navigator.of(context).push(
                              fade(
                                page: SettingsScreen(profileBloc: profileBloc),
                              ),
                            );
                          },
                          iconPath: AppIcons.settings,
                        ),
                      ],
                    ),
                    ProfilItemsBox(
                      marginBottom: SizeConfig.v(20),
                      marginTop: SizeConfig.v(12),
                      widgets: [
                        ProfileMenuTile(
                          name: LocaleKeys.about_app.tr(),
                          onTap: () {
                            Navigator.of(context).push(
                              fade(
                                page: const AboutAppScreen(),
                              ),
                            );
                          },
                          iconPath: AppIcons.info,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
                // return const Center(child: CupertinoActivityIndicator());
                // },
                ),
      );
}

final countItem = <List<String>>[
  [
    LocaleKeys.favorites.tr(),
    LocaleKeys.comparisons.tr(),
  ],
  [
    LocaleKeys.my_ads.tr(),
    LocaleKeys.my_searchs,
    LocaleKeys.my_reviews.tr(),
  ],
  [
    LocaleKeys.directory.tr(),
    LocaleKeys.chat.tr(),
    LocaleKeys.settings.tr(),
  ],
  [
    LocaleKeys.directory.tr(),
  ],
];

final names = <List<String>>[
  [
    LocaleKeys.favorites.tr(),
    LocaleKeys.comparisons.tr(),
  ],
  [
    LocaleKeys.my_ads.tr(),
    LocaleKeys.my_searchs,
    LocaleKeys.my_reviews.tr(),
  ],
  [
    LocaleKeys.directory.tr(),
    LocaleKeys.chat.tr(),
    LocaleKeys.settings.tr(),
  ],
  [
    LocaleKeys.directory.tr(),
  ],
];
