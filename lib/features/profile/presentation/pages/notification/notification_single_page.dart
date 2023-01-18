import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:formz/formz.dart';

class NotificationSinglePage extends StatelessWidget {
  const NotificationSinglePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const WAppBar(
          hasBackButton: true,
          title: 'Уведомления',
        ),
        body: BlocBuilder<UserWishListsBloc, UserWishListsState>(
          builder: (context, state) {
            if (state.myAdsStatus.isSubmissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (state.myAdsStatus.isSubmissionSuccess) {
              final notification = state.notificationSingle;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: SizeConfig.v(16)),
                  child: Column(
                    children: [
                      SizedBox(
                        width: SizeConfig.h(375),
                        height: SizeConfig.v(219),
                        child: CachedNetworkImage(
                          imageUrl: notification.cover ?? '',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Image.asset(
                            AppImages.carPlaceHolder,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: SizeConfig.h(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: SizeConfig.v(16)),
                            Text(
                                '#${notification.category?.name} • 2 часа назад',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(color: greyText, fontSize: 13)),
                            SizedBox(height: SizeConfig.v(8)),
                            if(notification.title!=null) 
                            Text(
                              notification.title!,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(height: SizeConfig.v(6)),
                            const Divider(height: 12),
                          ],
                        ),
                      ),
                      Html(
                        data: notification.content,
                        style: {
                          'p': Style(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.h(6)),
                              color: dark,
                              fontSize: FontSize(13),
                              fontWeight: FontWeight.w400)
                        },
                      ),
                      SizedBox(height: SizeConfig.v(16)),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: Text('Xatolik'),
            );
          },
        ),
      );
}
