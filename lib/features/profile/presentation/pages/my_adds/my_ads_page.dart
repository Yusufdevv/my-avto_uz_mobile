import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/usecases/get_my_searches_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_single_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class MyAdsPage extends StatefulWidget {
  const MyAdsPage({Key? key}) : super(key: key);

  @override
  State<MyAdsPage> createState() => _MyAdsPageState();
}

class _MyAdsPageState extends State<MyAdsPage> {
  late UserWishListsBloc bloc;

  @override
  void initState() {
    bloc = UserWishListsBloc()
      ..add(GetUserMyAdsEvent(endpoint: '/car/my-announcements/'));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, item) => [
                SliverAppBar(
                  pinned: true,
                  leadingWidth: 40,
                  leading: GestureDetector(
                    onTap: () => Navigator.pop(context), behavior: HitTestBehavior.opaque,
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              AppIcons.chevronLeft,
                            )),
                      ],
                    ),
                  ),
                  title: Text(LocaleKeys.my_ads.tr()),
                ),
                SliverPersistentHeader(
                  delegate: ProfileTabBar(
                    onTap: (index) {},
                    tabs: [
                      LocaleKeys.all.tr(),
                      LocaleKeys.using.tr(),
                      LocaleKeys.close.tr(),
                    ],
                  ),
                )
              ],
              body: BlocBuilder<UserWishListsBloc, UserWishListsState>(
                  builder: (context, state) {
                if (state.myAdsStatus.isSubmissionInProgress) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                if (state.myAdsStatus.isSubmissionSuccess) {
                  final myAds = state.myAds;
                  final activeAds = myAds.where((e) => !e.isExpired).toList();
                  final noActive = myAds.where((e) => e.isExpired).toList();
                  return TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      AllAds(
                        autoEntity: myAds,
                        moderationStatus: null,
                      ),
                      AllAds(
                        autoEntity: activeAds,
                        moderationStatus: 'active',
                      ),
                      AllAds(
                        autoEntity: noActive,
                        moderationStatus: 'blocked,in_moderation,sold',
                      ),
                    ],
                  );
                }
                return Center(child: Text(LocaleKeys.error.tr()));
              }),
            ),
          ),
        ),
      );
}
