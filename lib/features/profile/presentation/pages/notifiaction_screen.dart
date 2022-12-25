import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/profile/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          hasBackButton: true,
          title: 'Уведомления',
          centerTitle: true,
          extraActions: [
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.h(16)),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AppIcons.checks,
                  color: orange,
                ),
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => NotificationItem(
            currentIndex: index,
            title: '#Штрафы • 2 часа назад',
            subTitle:
                'Новые штрафы в 2023 году: какие изменения ждут водителей. Таблitsa dadad',
            isRead: true,
            image:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/BMW_logo_%28gray%29.svg/2048px-BMW_logo_%28gray%29.svg.png',
          ),
        ),
      );
}

