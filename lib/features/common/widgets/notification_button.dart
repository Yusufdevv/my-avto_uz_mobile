import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/auth/authentication_bloc.dart';
import 'package:auto/features/common/domain/model/user.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/pages/notification/notifiactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class NotificationButton extends StatefulWidget {
  const NotificationButton({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  @override
  void initState() {
    super.initState();
  }

  late UserModel user;

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, stateLis) {
        print(
            '======= ${user.isReadAllNotifications != stateLis.user.isReadAllNotifications}');
        print('=======listener ${stateLis.user.isReadAllNotifications}');
        user = stateLis.user;
      }, builder: (context, state) {
        print('=======builder ${state.user.isReadAllNotifications}');

        user = state.user;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.of(context, rootNavigator: true)
                .push(fade(page: const NotificationPage()));
            if (!user.isReadAllNotifications) {
              context
                  .read<AuthenticationBloc>()
                  .add(ChangeNotificationAllRead());
              setState(() {});
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: user.isReadAllNotifications
                ? SvgPicture.asset(AppIcons.bell)
                : SvgPicture.asset(AppIcons.bellWithCircle),
          ),
        );
      });
}
