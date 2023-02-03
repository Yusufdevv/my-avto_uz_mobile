import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/domain/entities/profile_data_entity.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
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

  late bool isAllread;

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ProfileBloc, ProfileState>(listener: (context, stateLis) {
        if (stateLis.changeStatus.isSubmissionSuccess) {
          isAllread = stateLis.isNotificationAllRead;
        }
      }, builder: (context, state) {
                  isAllread = state.isNotificationAllRead;

        if (state.changeStatus.isSubmissionSuccess ||
            state.changeStatus.isSubmissionFailure) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .push(fade(page: const NotificationPage()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: isAllread
                  ? SvgPicture.asset(AppIcons.bell)
                  : SvgPicture.asset(AppIcons.bellWithCircle),
            ),
          );
        }
        return const SizedBox();
      });
}
