import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/favorites/presentation/favourite_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/about_app_screen.dart';
import 'package:auto/features/profile/presentation/pages/chat.dart';
import 'package:auto/features/profile/presentation/pages/my_ad_screen.dart';
import 'package:auto/features/profile/presentation/pages/see_profile_screen.dart';
import 'package:auto/features/profile/presentation/pages/password_changing_screen.dart';
import 'package:auto/features/profile/presentation/pages/settings_screen.dart';
import 'package:auto/features/profile/presentation/widgets/profile_data.dart';
import 'package:auto/features/profile/presentation/widgets/profile_divider.dart';
import 'package:auto/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final names = <List<String>>[
    ['Избраннные', 'Сравнения'],
    ['Мои объявления', 'Мои поиски', 'Мои отзывы'],
    ['Справочник', 'Чат', 'Настройки'],
    ['Справочник'],
  ];
  final countItem = <List<String>>[
    ['Избраннные', 'Сравнения'],
    ['Мои объявления', 'Мои поиски', 'Мои отзывы'],
    ['Справочник', 'Чат', 'Настройки'],
    ['Справочник'],
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const WAppBar(
        filledBackButton: true,
        hasBackButton: false,
        textWithButton: 'Мой профиль',
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
                      page: const SeeProfileScreen(),
                    ),
                  );
                },
                title: 'Шохрух Бахтияров',
                subTitle: '0 объявлений',
                imageUrl:
                    'https://images.unsplash.com/photo-1658739398669-0df60d6b39e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                margin: const EdgeInsets.only(top: 16, bottom: 12),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: iconBackground),
                margin: const EdgeInsets.only(bottom: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  'Номер телефона не зарегистрирован ☹️\nДля пользования всеми функциями приложения необходимо зарегистрировать номер телефона',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 12),
                ),
              ),
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context)
                          .extension<WTextFieldStyle>()!
                          .borderColor),
                ),
                child: Column(
                  children: [
                    ProfileMenuTile(
                      name: 'Избраннные',
                      onTap: () {
                        Navigator.push(context, fade(page: FavouriteScreen()));
                      },
                      iconPath: AppIcons.heartBlue,
                      count: 37,
                    ),
                    const ProfileDivider(),
                    ProfileMenuTile(
                      name: 'Сравнения',
                      onTap: () {},
                      iconPath: AppIcons.scales,
                      count: 54,
                    ),
                    const ProfileDivider(),
                    ProfileMenuTile(
                      name: 'Мои объявления',
                      onTap: () {
                        Navigator.of(context).push(
                          fade(
                            page: const MyAdScreen(),
                          ),
                        );
                      },
                      iconPath: AppIcons.tabletNews,
                      count: 23,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).extension<ThemedColors>()!.whiteToNero1,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context)
                          .extension<WTextFieldStyle>()!
                          .borderColor),
                ),
                child: Column(
                  children: [
                    ProfileMenuTile(
                      name: 'Чат',
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                          fade(
                            page: const Chat(
                              hasChat: false,
                            ),
                          ),
                        );
                      },
                      iconPath: AppIcons.message,
                      count: 64,
                    ),
                    const ProfileDivider(),
                    ProfileMenuTile(
                      name: 'Настройки',
                      onTap: () {
                        Navigator.of(context).push(
                          fade(
                            page: SettingsScreen(),
                          ),
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
                    name: 'О приложении',
                    onTap: () {
                      Navigator.of(context).push(
                        fade(
                          page: const AboutAppScreen(),
                        ),
                      );
                    },
                    iconPath: AppIcons.info,
                  ))
            ],
          ),
        ),
      ));
}
