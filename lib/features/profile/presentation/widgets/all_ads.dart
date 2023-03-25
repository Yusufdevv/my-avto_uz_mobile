import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
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

  const AllAds({
    required this.moderationStatus,
    Key? key,
  }) : super(key: key);

  @override
  State<AllAds> createState() => _AllAdsState();
}

class _AllAdsState extends State<AllAds>  with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    context
        .read<UserWishListsBloc>()
        .add(GetUserMyAdsEvent(moderationStatus: widget.moderationStatus));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<UserWishListsBloc, UserWishListsState>(
          builder: (context, state) {
        if (state.myAdsStatus.isSubmissionInProgress) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state.myAdsStatus.isSubmissionSuccess) {
          return state.myAds.isNotEmpty
              ? Paginator(
                  hasMoreToFetch: state.moreFetchMyAds,
                  fetchMoreFunction: () {
                    context.read<UserWishListsBloc>().add(GetMoreUserMyAdsEvent(
                        moderationStatus: widget.moderationStatus));
                  },
                  loadingWidget: const CupertinoActivityIndicator(),
                  itemCount: state.myAds.length,
                  paginatorStatus: state.myAdsStatus,
                  errorWidget: const SizedBox(),
                  itemBuilder: (context, index) {
                    final item = state.myAds[index];
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: 12, top: index == 0 ? 12 : 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(fade(
                            page: CarSingleScreen(
                              id: item.id,
                              moderationStatus: item.moderationStatus,
                            ),
                          ));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 12),
                          color: white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyAdImagesPart(item: item),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ModerationStatusPart(
                                        moderationStatus:
                                            item.moderationStatus),
                                    //
                                    MyAdCarDescPart(item: item),
                                    //
                                    if (item.moderationStatus != ModerationStatusEnum.blocked.value)
                                      MyAdDesc(
                                        moderationStatus:
                                            widget.moderationStatus,
                                        item: item,
                                      )
                                    else
                                      ReSendPart(
                                        item: item,
                                        moderationStatus:
                                            widget.moderationStatus,
                                      )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Center(
                  child: EmptyItemBody(
                      subtitle: '',
                      title: LocaleKeys.no_results.tr(),
                      image: AppIcons.carIcon),
                );
        }
        return Center(child: Text(LocaleKeys.error.tr()));
      });
  }

  @override
  bool get wantKeepAlive => true;
}
