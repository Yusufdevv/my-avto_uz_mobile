import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAdsPage extends StatefulWidget {
  const MyAdsPage({Key? key}) : super(key: key);

  @override
  State<MyAdsPage> createState() => _MyAdsPageState();
}

class _MyAdsPageState extends State<MyAdsPage> {
  late UserWishListsBloc bloc;

  @override
  void initState() {
    bloc = UserWishListsBloc();
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
            backgroundColor: borderCircular,
            body: NestedScrollView(
                headerSliverBuilder: (context, item) => [
                      SliverAppBar(
                        pinned: true,
                        leadingWidth: 40,
                        leading: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          behavior: HitTestBehavior.opaque,
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
                body: const TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    AllAds(
                      moderationStatus: '',
                    ),
                    AllAds(
                      moderationStatus: 'active',
                    ),
                    AllAds(
                      moderationStatus: 'blocked,in_moderation,sold',
                    ),
                  ],
                )),
          ),
        ),
      );
}
