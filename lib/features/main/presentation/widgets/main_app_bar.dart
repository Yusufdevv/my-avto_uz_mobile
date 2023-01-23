import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/notification/notifiactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: dark.withOpacity(0.08),
              offset: const Offset(0, 8),
              blurRadius: 19,
            ),
            BoxShadow(
              color: dark.withOpacity(0.16),
              offset: const Offset(0, -1),
              blurRadius: 0,
            ),
          ],
        ),
        child: AppBar(
          elevation: 0,
          actions: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context, rootNavigator: true)
                  .push(fade(page: const NotificationPage())),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
          title: SvgPicture.asset(
            Theme.of(context).extension<ThemedIcons>()!.imageUrl,
          ),
        ),
      );

  @override
  Size get preferredSize => AppBar().preferredSize;
}
