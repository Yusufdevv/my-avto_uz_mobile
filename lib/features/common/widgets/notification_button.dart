import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/notification/notifiactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationButton extends StatefulWidget {
  const NotificationButton({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  @override
  Widget build(BuildContext context) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .push(fade(page: const NotificationPage()));
        if (!context
            .read<AuthenticationBloc>()
            .state
            .user
            .isReadAllNotifications) {
          context.read<AuthenticationBloc>().add(ChangeNotificationAllRead());
          setState(() {});
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child:
            context.read<AuthenticationBloc>().state.user.isReadAllNotifications
                ? SvgPicture.asset(AppIcons.bell)
                : SvgPicture.asset(AppIcons.bellWithCircle),
      ),
    );
}
