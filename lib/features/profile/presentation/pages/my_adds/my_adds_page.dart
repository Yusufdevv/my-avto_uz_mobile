import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:auto/features/profile/domain/entities/profile_item_entity.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class MyAddsPage extends StatefulWidget {
  const MyAddsPage({Key? key}) : super(key: key);

  @override
  State<MyAddsPage> createState() => _MyAddsPageState();
}

class _MyAddsPageState extends State<MyAddsPage> {
  final List<ProfileItemEntity> list = [];
  late UserWishListsBloc bloc;

  @override
  void initState() {
    final repo = serviceLocator<GetUserListRepoImpl>();
    bloc = UserWishListsBloc(
      profileFavoritesUseCase: GetUserFavoritesMyAdsUseCase(repository: repo),
    )..add(GetUserMyAdsEvent(endpoint: '/car/my-announcements/'));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                    onTap: () => Navigator.pop(context),
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
                  return myAds.isNotEmpty
                      ? TabBarView(
                          children: [
                            AllAds(autoEntity: myAds),
                            AllAds(autoEntity: myAds),
                            AllAds(autoEntity: myAds),
                          ],
                        )
                      : const EmptyItemBody(title: 'У вас еще нет объявлений');
                }
                return const Center(child: Text('Xatolik!'));
              }),
            ),
          ),
        ),
      );
}
