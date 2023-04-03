import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/pages/notification/notifiactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

// ignore: must_be_immutable
class NotificationButton extends StatelessWidget {
  NotificationButton({
    Key? key,
  }) : super(key: key);

  late bool isAllread;

  final theme = StorageRepository.getString(StorageKeys.THEME_MODE);

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
                  : SvgPicture.asset(
                      theme == 'dark'
                          ? AppIcons.bellWithCircleDark
                          : AppIcons.bellWithCircle,
                    ),
            ),
          );
        }
        return const SizedBox();
      });
}
