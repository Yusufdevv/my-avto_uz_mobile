import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_single.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/pages/notification/notification_single_page.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
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
    final repo = serviceLocator<GetUserListRepoImpl>();
    bloc = UserWishListsBloc(
      profileFavoritesMyAdsUseCase:
          GetUserFavoritesMyAdsUseCase(repository: repo),
      getNotificationSingleUseCase:
          GetNotificationSingleUseCase(repository: repo),
      getNotificationsUseCase: GetNotificationsUseCase(repository: repo),
    )..add(GetNotificationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: Scaffold(
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
          body: BlocBuilder<UserWishListsBloc, UserWishListsState>(
            builder: (context, state) {
              if (state.myAdsStatus.isSubmissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state.myAdsStatus.isSubmissionSuccess) {
                final notifications = state.notifications;
                return notifications.isEmpty
                    ? ListView.builder(
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
                                    child: const NotificationSinglePage(),
                                  )));
                            },
                            child: NotificationItem(
                              currentIndex: index,
                              category:
                                  '#${item.category?.name} • 2 часа назад',
                              title: item.title!,
                              isRead: item.isRead!,
                              image: item.cover!,
                            ),
                          );
                        },
                      )
                    : const EmptyItemBody(
                        title: 'Нет уведомлении',
                        subtitle:
                            'Пока нет уведомлении, они будут отображаться в данном разделе.',
                        image: AppIcons.notification);
              }
              return const Center(
                child: Text('Xatolik!'),
              );
            },
          ),
        ),
      );
}
