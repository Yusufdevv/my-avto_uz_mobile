import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/comparison/data/repositories/comparison_cars_repo_impl.dart';
import 'package:auto/features/comparison/domain/usecases/comparison_cars_use_case.dart';
import 'package:auto/features/comparison/presentation/bloc/comparison-bloc/comparison_bloc.dart';
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
import 'package:auto/features/profile/presentation/pages/favourite_page.dart';
import 'package:auto/features/profile/presentation/pages/my_searches_page.dart';
import 'package:auto/features/profile/presentation/pages/notifiaction_screen.dart';
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
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc profileBloc;
  late ImageBloc imageBloc;
  late ComparisonBloc bloc;

  @override
  void initState() {
    final repo = serviceLocator<ProfileRepositoryImpl>();
    profileBloc = ProfileBloc(
      changePasswordUseCase: ChangePasswordUseCase(repository: repo),
      editProfileUseCase: EditProfileUseCase(repository: repo),
      profileUseCase: ProfileUseCase(repository: repo),
      profileFavoritesUseCase: ProfileFavoritesUseCase(repository: repo),
    )
      ..add(GetProfileEvent())
      ..add(GetProfileFavoritesEvent());
    imageBloc = ImageBloc();
    bloc = ComparisonBloc(
        comparisonCarsUseCase: ComparisonCarsUseCase(
            comparisonCarsRepo: serviceLocator<ComparisonCarsRepoImpl>()))
      ..add(GetComparableCars());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: profileBloc,
          ),
          BlocProvider.value(
            value: bloc,
          ),
        ],
        child: BlocBuilder<ProfileBloc, ProfileState>(
            // ignore: prefer_expression_function_bodies
            builder: (context, state) {
          // if (state.status.isPure) {
          //   context.read<ProfileBloc>().add(GetProfileEvent());
          //   // context.read<ProfileBloc>().add(GetProfileFavoritesEvent());
          // }
          // else if (state.status.isSubmissionInProgress) {
          //   return const Center(child: CupertinoActivityIndicator());
          // } else if (state.status.isSubmissionFailure) {
          //   return const Center(child: Text('Fail'));
          // } else if (state.status.isSubmissionSuccess) {
          return Scaffold(
            appBar: WAppBar(
                filledBackButton: true,
                boxShadow: const [
                  BoxShadow(offset: Offset(0, 0), blurRadius: 0, color: white),
                ],
                extraActions: [
                  Padding(
                    padding: EdgeInsets.only(right: SizeConfig.h(16)),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context, rootNavigator: true)
                          .push(fade(page: const NotificationScreen())),
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
                        Navigator.of(context).push(fade(
                            page: SeeProfileScreen(
                          announcementCount: state
                              .profileEntity.usercountdata!.announcementsCount!,
                          profileEntity: state.profileEntity,
                          profileBloc: profileBloc,
                          imageBloc: imageBloc,
                        )));
                      },
                      title: state.profileEntity.fullName ?? '',
                      subTitle:
                          '//${state.profileEntity.usercountdata?.announcementsCount} ${LocaleKeys.how_many_ads.tr()}',
                      imageUrl: state.profileEntity.image ?? '',
                      margin: EdgeInsets.only(
                          top: SizeConfig.v(16), bottom: SizeConfig.v(12)),
                    ),

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
                                          favoriteEntity:
                                              state.favoriteEntity)));
                            },
                            iconPath: AppIcons.heartBlue,
                            count: state.profileEntity.usercountdata
                                ?.announcementWishlistCount),
                        const ProfileDivider(),
                        BlocBuilder<ComparisonBloc, ComparisonState>(
                          builder: (context, state) => ProfileMenuTile(
                            name: LocaleKeys.comparisons.tr(),
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                fade(
                                  page: ComparisonPage(bloc: bloc),
                                ),
                              );
                            },
                            iconPath: AppIcons.scales,
                            count: state.cars.length,
                          ),
                        ),
                      ],
                    ),

                    // moi obnovleniya
                    ProfilItemsBox(marginTop: SizeConfig.v(12), widgets: [
                      ProfileMenuTile(
                          name: LocaleKeys.my_ads.tr(),
                          onTap: () {
                            // Navigator.of(context)
                            //     .push(fade(page: const MyAdScreen()));
                          },
                          iconPath: AppIcons.tabletNews,
                          count: state
                              .profileEntity.usercountdata?.announcementsCount),
                      const ProfileDivider(),
                      ProfileMenuTile(
                          name: 'Мои поиски',
                          onTap: () {
                            Navigator.push(
                                context, fade(page: const MySearchesPage()));
                          },
                          iconPath: AppIcons.mySearch,
                          count:
                              state.profileEntity.usercountdata?.searchCount),
                      const ProfileDivider(),
                      ProfileMenuTile(
                          name: 'Мои отзывы',
                          onTap: () {
                            Navigator.of(context)
                                .push(fade(page: const ReviewsScreen()));
                          },
                          iconPath: AppIcons.message,
                          count:
                              state.profileEntity.usercountdata?.reviewsCount),
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
                          count: 0),
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
                            Navigator.of(context, rootNavigator: true).push(
                                fade(
                                    page: Chat(
                                        hasChat: false, imageBloc: imageBloc)));
                          },
                          iconPath: AppIcons.message),
                      const ProfileDivider(),
                      ProfileMenuTile(
                          name: LocaleKeys.settings.tr(),
                          onTap: () {
                            Navigator.of(context).push(
                              fade(
                                  page:
                                      SettingsScreen(profileBloc: profileBloc)),
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
                                  page: const AboutAppScreen(),
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
            //   return const Center(child: CupertinoActivityIndicator());
            // },
            ),
      );
}
