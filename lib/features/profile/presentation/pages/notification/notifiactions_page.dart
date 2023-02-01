import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
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
import 'package:url_launcher/url_launcher.dart';

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
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: CustomScreen(
          child: Scaffold(
            appBar: WAppBar(
              hasBackButton: true,
              title: LocaleKeys.notifications.tr(),
              centerTitle: true,
              extraActions: [
                WScaleAnimation(
                  onTap: () async {
                    if (await canLaunchUrl(Uri.parse('https://google.com'))) {
                      setState(() {
                        isAllRead = true;
                      });
                      bloc.add(NotificationAllReadEvent());
                      context.read<ShowPopUpBloc>().add(ShowPopUp(
                          message: "Barcha xabarlar o'qildi", isSucces: true));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.h(16)),
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child:
                            SvgPicture.asset(AppIcons.checks, color: orange)),
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
                      ? ListView.builder(
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
                                      '#${item.category?.name} • ${MyFunctions.getAutoPublishDate(item.createdAt!)}',
                                  title: item.title ?? '',
                                  isRead: isAllRead ? isAllRead : item.isRead!,
                                  image: item.cover ?? '',
                                ));
                          },
                        )
                      : EmptyItemBody(
                          title: LocaleKeys.no_notice.tr(),
                          subtitle: LocaleKeys.w_t_is_no_n_t_w_be.tr(),
                          image: AppIcons.notification);
                }
                return Center(
                  child: Text(LocaleKeys.error.tr()),
                );
              },
            ),
          ),
        ),
      );
}
