import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/profile/presentation/pages/my_ad_screen.dart';
import 'package:auto/features/profile/presentation/pages/settings_screen.dart';
import 'package:auto/features/profile/presentation/widgets/container_with_border.dart';
import 'package:auto/features/profile/presentation/widgets/profile_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const WAppBar(
        filledBackButton: true,
        centerTitle: false,
        hasBackButton: false,
        backgroundColor: white,
        title: 'Мой профиль',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ProfileData(
              onTap: () {},
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                'Номер телефона не зарегистрирован ☹️\nДля пользования всеми функциями приложения необходимо зарегистрировать номер телефона',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 12),
              ),
            ),
            ContainerWithBorder(
              margin: const EdgeInsets.only(bottom: 12),
              icons: AppIcons.heart,
              countItem: 47,
              count: 2,
              title: 'Избраннные',
              onTap: () {},
            ),
            ContainerWithBorder(
              margin: const EdgeInsets.only(bottom: 12),
              icons: AppIcons.russia,
              countItem: 47,
              count: 3,
              title: 'Мои объявления',
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const MyAdScreen(),
                  ),
                );
              },
            ),
            ContainerWithBorder(
              margin: const EdgeInsets.only(bottom: 12),
              icons: AppIcons.settings,
              countItem: 21,
              count: 1,
              title: 'Настройки',
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
            ContainerWithBorder(
              margin: const EdgeInsets.only(bottom: 12),
              icons: AppIcons.info,
              count: 1,
              title: 'О приложении',
              onTap: () {},
            ),
          ],
        ),
      ));
}
