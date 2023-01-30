import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:auto/features/profile/presentation/widgets/moderation_status_part.dart';
import 'package:auto/features/profile/presentation/widgets/my_ad_car_desc_part.dart';
import 'package:auto/features/profile/presentation/widgets/my_ad_desc_part.dart';
import 'package:auto/features/profile/presentation/widgets/my_ad_images_part.dart';
import 'package:auto/features/profile/presentation/widgets/resend_part.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AllAds extends StatefulWidget {
  final String moderationStatus;
  const AllAds({required this.moderationStatus, Key? key}) : super(key: key);

  @override
  State<AllAds> createState() => _AllAdsState();
}

class _AllAdsState extends State<AllAds> {
  @override
  void initState() {
    print('======= ${widget.moderationStatus}');
    context
        .read<UserWishListsBloc>()
        .add(GetUserMyAdsEvent(moderationStatus: widget.moderationStatus));
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UserWishListsBloc, UserWishListsState>(
          builder: (context, state) {
        if (state.myAdsStatus.isSubmissionInProgress) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state.myAdsStatus.isSubmissionSuccess) { 
          return state.myAds.isNotEmpty
              ? Paginator(
                  physics: const BouncingScrollPhysics(),
                  hasMoreToFetch: state.moreFetch,
                  fetchMoreFunction: () {
                    context.read<UserWishListsBloc>().add(GetMoreUserMyAdsEvent(
                        moderationStatus: widget.moderationStatus));
                  },
                  itemCount: state.myAds.length,
                  paginatorStatus: state.myAdsStatus,
                  errorWidget: const SizedBox(),
                  itemBuilder: (context, index) {
                    final item = state.myAds[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: SizeConfig.v(12),
                          top: index == 0 ? SizeConfig.v(12) : 0),
                      child: Container(
                        padding: EdgeInsets.only(top: SizeConfig.v(12)),
                        color: white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyAdImagesPart(item: item),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.v(16)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ModerationStatusPart(
                                      moderationStatus: item.moderationStatus),
                                  //
                                  MyAdCarDescPart(item: item),
                                  //
                                  if (item.moderationStatus != 'blocked')
                                    MyAdDesc(item: item)
                                  else
                                    ReSendPart(item: item)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : Center(
                  child: EmptyItemBody(
                      subtitle: LocaleKeys.you_dont_have_ads.tr(),
                      image: AppIcons.carIcon),
                );
        }
        return Center(child: Text(LocaleKeys.error.tr()));
      });
}