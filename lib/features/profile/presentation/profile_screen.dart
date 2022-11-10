import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/comparison/presentation/pages/comaparison_page2.dart';
import 'package:auto/features/favorites/presentation/favourite_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/posting_ad/add_photo/presentation/blocs/image_bloc.dart';
import 'package:auto/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:auto/features/profile/domain/usecases/change_password.dart';
import 'package:auto/features/profile/domain/usecases/edit_profile.dart';
import 'package:auto/features/profile/domain/usecases/profile.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/about_app_screen.dart';
import 'package:auto/features/profile/presentation/pages/chat.dart';
import 'package:auto/features/profile/presentation/pages/see_profile_screen.dart';
import 'package:auto/features/profile/presentation/pages/settings_screen.dart';
import 'package:auto/features/profile/presentation/widgets/profile_data.dart';
import 'package:auto/features/profile/presentation/widgets/profile_divider.dart';
import 'package:auto/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
  initState() {
    profileBloc = ProfileBloc(
        changePasswordUseCase: ChangePasswordUseCase(
            repository: serviceLocator<ProfileRepositoryImpl>()),
        editProfileUseCase: EditProfileUseCase(
            repository: serviceLocator<ProfileRepositoryImpl>()),
        profileUseCase: ProfileUseCase(
            repository: serviceLocator<ProfileRepositoryImpl>()));
    imageBloc = ImageBloc();
    super.initState();
  }

  dispose() {
    profileBloc.close();
    imageBloc.close();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: profileBloc,
        child:
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          print(state.status);
          // if (state.status.isPure) {
          //   context.read<ProfileBloc>().add(GetProfileEvent());
          // } else if (state.status.isSubmissionFailure) {
          //   return const Center(child: CupertinoActivityIndicator());
          // } else if (state.status.isSubmissionFailure) {
          //   return const Center(child: Text("Fail"));
          // } else if (state.status.isSubmissionFailure) {

          return Scaffold(
            appBar: WAppBar(
              filledBackButton: true,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 0,
                  color: white,
                ),
              ],
              hasBackButton: false,
              textWithButton: LocaleKeys.my_profile.tr(),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      subTitle: '0 ' + LocaleKeys.how_many_ads.tr(),
                      imageUrl: 'https://images.unsplash.com/photo-1667860920650-d23d24c0e4de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                      margin: const EdgeInsets.only(top: 16, bottom: 12),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(12), color: iconBackground),
                    //   margin: const EdgeInsets.only(bottom: 12),
                    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    //   child: Text(
                    //     LocaleKeys.number_dont_regist.tr(),
                    //     textAlign: TextAlign.center,
                    //     style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 12),
                    //   ),
                    // ),
                    Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteToNero1,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Theme.of(context)
                                .extension<WTextFieldStyle>()!
                                .borderColor),
                      ),
                      child: Column(
                        children: [
                          ProfileMenuTile(
                            name: LocaleKeys.favorites.tr(),
                            onTap: () {
                              Navigator.push(
                                  context, fade(page: FavouriteScreen()));
                            },
                            iconPath: AppIcons.heartBlue,
                            count: 37,
                          ),
                          const ProfileDivider(),
                          ProfileMenuTile(
                            name: LocaleKeys.comparisons.tr(),
                            onTap: () {
                              Navigator.of(context).push(fade(
                                  page: const ComparisonPage2(
                                numberOfAddedCars: 5,
                              )));
                            },
                            iconPath: AppIcons.scales,
                            count: 54,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteToNero1,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Theme.of(context)
                                .extension<WTextFieldStyle>()!
                                .borderColor),
                      ),
                      child: Column(
                        children: [
                          ProfileMenuTile(
                            name: LocaleKeys.my_ads.tr(),
                            onTap: () {},
                            iconPath: AppIcons.tabletNews,
                            count: 23,
                          ),
                          const ProfileDivider(),
                          ProfileMenuTile(
                            name: 'Мои поиски',
                            onTap: () {},
                            iconPath: AppIcons.mySearch,
                            count: 23,
                          ),
                          const ProfileDivider(),
                          ProfileMenuTile(
                            name: 'Мои отзывы',
                            onTap: () {},
                            iconPath: AppIcons.message,
                            count: 64,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteToNero1,
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                        border: Border.all(
                            color: Theme.of(context)
                                .extension<WTextFieldStyle>()!
                                .borderColor),
                      ),
                      child: Column(
                        children: [
                          ProfileMenuTile(
                            name: 'Дилеры',
                            onTap: () {},
                            iconPath: AppIcons.dealers,
                            count: 23,
                          ),
                          const ProfileDivider(),
                          ProfileMenuTile(
                            name: 'Справочник',
                            onTap: () {},
                            iconPath: AppIcons.direct,
                            count: 23,
                          ),
                          const ProfileDivider(),
                          ProfileMenuTile(
                            name: 'Чат',
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                fade(
                                  page: Chat(
                                    hasChat: false,
                                    imageBloc: imageBloc,
                                  ),
                                ),
                              );
                            },
                            iconPath: AppIcons.message,
                            count: 64,
                          ),
                          const ProfileDivider(),
                          ProfileMenuTile(
                            name: LocaleKeys.settings.tr(),
                            onTap: () {
                              Navigator.of(context).push(
                                fade(
                                    page: SettingsScreen(
                                        profileBloc: profileBloc)),
                              );
                            },
                            iconPath: AppIcons.settings,
                            count: 12,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12, bottom: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteToNero1,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Theme.of(context)
                                .extension<WTextFieldStyle>()!
                                .borderColor),
                      ),
                      child: ProfileMenuTile(
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
                    )
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
