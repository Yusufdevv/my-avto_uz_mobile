import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:formz/formz.dart';

class NotificationSinglePage extends StatelessWidget {
  const NotificationSinglePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          hasBackButton: true,
          title: LocaleKeys.notifications.tr(),
        ),
        body: BlocBuilder<UserWishListsBloc, UserWishListsState>(
          builder: (context, state) {
            if (state.myAdsStatus.isSubmissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (state.myAdsStatus.isSubmissionSuccess) {
              final notification = state.notificationSingle;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 375,
                        height: 219,
                        child: CachedNetworkImage(
                          imageUrl: notification.notification.cover ?? '',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Image.asset(
                            AppImages.carPlaceHolder,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                                '#${notification.notification.category?.name} • ${MyFunctions.getAutoPublishDate(notification.notification.createdAt ?? '')}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: greyText, fontSize: 13)),
                            const SizedBox(height: 8),
                            if (notification.notification.title != null)
                              Text(
                                notification.notification.title!,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            const SizedBox(height: 6),
                            const Divider(height: 12),
                          ],
                        ),
                      ),
                      Html(
                        data: notification.notification.content,
                        style: {
                          'p': Style(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6),
                              color: dark,
                              fontSize: FontSize(13),
                              fontWeight: FontWeight.w400)
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: Text(LocaleKeys.error.tr()),
            );
          },
        ),
      );
}
