import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/pages/notification/notification_single_page.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late UserWishListsBloc bloc;

  @override
  void initState() {
    bloc = UserWishListsBloc()..add(GetNotificationsEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  bool isAllRead = false;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          context
              .read<ProfileBloc>()
              .add(GetNoReadNotificationsEvent(filter: 0));
          return true;
        },
        child: BlocProvider.value(
          value: bloc,
          child: CustomScreen(
            child: Scaffold(
              appBar: WAppBar(
                hasBackButton: true,
                onTapBack: () {
                  context
                      .read<ProfileBloc>()
                      .add(GetNoReadNotificationsEvent(filter: 0));
                  Navigator.pop(context);
                },
                title: LocaleKeys.notifications.tr(),
                centerTitle: true,
                extraActions: [
                  WScaleAnimation(
                    onTap: () async {
                      if (!isAllRead) {
                        setState(() {
                          isAllRead = true;
                        });
                        bloc.add(NotificationAllReadEvent());
                        context
                            .read<ProfileBloc>()
                            .add(GetNoReadNotificationsEvent(filter: 0));
                        context.read<ShowPopUpBloc>().add(ShowPopUp(
                            message: LocaleKeys.all_messages_ridden.tr(),
                            status: PopStatus.success));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(AppIcons.checks,
                              color: context
                                      .watch<ProfileBloc>()
                                      .state
                                      .isNotificationAllRead
                                  ? grey
                                  : orange)),
                    ),
                  )
                ],
              ),
              body: BlocBuilder<UserWishListsBloc, UserWishListsState>(
                builder: (context, state) {
                  if (state.myAdsStatus.isSubmissionInProgress) {
                    return const Center(child: CupertinoActivityIndicator());
                  }
                  if (state.myAdsStatus.isSubmissionSuccess) {
                    final notifications = state.notifications;
                    return notifications.isNotEmpty
                        ? Paginator(
                            paginatorStatus: state.myAdsStatus,
                            fetchMoreFunction: () {
                              bloc.add(GetMoreNotificationsEvent());
                            },
                            hasMoreToFetch: state.moreFetchNotifications,
                            loadingWidget: const SizedBox(),
                            errorWidget: const SizedBox(),
                            physics: const BouncingScrollPhysics(),
                            itemCount: notifications.length,
                            itemBuilder: (context, index) {
                              final item = notifications[index];
                              return InkWell(
                                  onTap: () {
                                    context.read<UserWishListsBloc>().add(
                                        GetNotificationSingleEvent(
                                            id: item.id.toString()));
                                    Navigator.push(
                                        context,
                                        fade(
                                            page: BlocProvider.value(
                                                value: bloc,
                                                child:
                                                    const NotificationSinglePage())));
                                    if (item.isRead != null && !item.isRead!) {
                                      context
                                          .read<UserWishListsBloc>()
                                          .add(ChangeReadEvent(index: index));
                                    }
                                  },
                                  child: NotificationItem(
                                    currentIndex: index,
                                    category:
                                        '#${item.notification.category?.name} • ${item.notification.createdAt == '' ? '' : MyFunctions.getAutoPublishDate(item.notification.createdAt ?? '')}',
                                    title: item.notification.title ?? '',
                                    isRead:
                                        isAllRead ? isAllRead : item.isRead!,
                                    image: item.notification.cover ?? '',
                                  ));
                            },
                          )
                        : Center(
                            child: EmptyItemBody(
                              title: LocaleKeys.no_notice.tr(),
                              subtitle: LocaleKeys.w_t_is_no_n_t_w_be.tr(),
                              image: StorageRepository.getString(
                                          StorageKeys.THEME_MODE) ==
                                      'light'
                                  ? AppIcons.notification
                                  : AppIcons.notificationDark,
                            ),
                          );
                  }
                  return Center(
                    child: Text(LocaleKeys.error.tr()),
                  );
                },
              ),
            ),
          ),
        ),
      );
}
