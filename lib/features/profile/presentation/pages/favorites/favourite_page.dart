import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/usecases/get_my_searches_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_single.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:auto/features/profile/presentation/widgets/favorite_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class FavouritePage extends StatefulWidget {
  final ProfileBloc profileBloc;
  const FavouritePage({required this.profileBloc, Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
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
        getMySearchesUseCase: GetMySearchesUseCase(repository: repo))
      ..add(GetUserFavoritesEvent(
          endpoint: '/users/wishlist/announcement/list/'));
    super.initState();
  }

  final listkey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: WAppBar(
            title: LocaleKeys.favorites.tr(),
            centerTitle: false,
          ),
          body: BlocConsumer<WishlistAddBloc, WishlistAddState>(
            listener: (context, stateWish) {
              if (stateWish.addStatus.isSubmissionSuccess ||
                  stateWish.removeStatus.isSubmissionSuccess) {
                final item1 = bloc.state.favorites[stateWish.index];
                listkey.currentState!.removeItem(
                    stateWish.index,
                    (context, animation) => FavoriteItem(
                        animation: animation,
                        gallery: item1.gallery,
                        carModelName: item1.model.name,
                        carYear: item1.year,
                        contactPhone: item1.contactPhone,
                        description: item1.description,
                        districtTitle: item1.district.title,
                        isNew: item1.isNew,
                        isWishlisted: item1.isWishlisted,
                        price: item1.price,
                        currency: item1.currency,
                        publishedAt: item1.publishedAt,
                        userFullName: item1.user.fullName,
                        userImage: item1.user.image,
                        userType: item1.userType,
                        hasComparison: item1.isComparison,
                        callFrom: item1.contactAvailableFrom,
                        callTo: item1.contactAvailableTo,
                        discount: item1.discount,
                        id: item1.id,
                        index: stateWish.index),
                    duration: const Duration(milliseconds: 600));
                context.read<UserWishListsBloc>().add(ChangeIsWishEvenet(
                    index: stateWish.index, id: stateWish.id));
                context
                    .read<WishlistAddBloc>()
                    .add(WishlistAddEvent.clearState());
                widget.profileBloc.add(ChangeCountDataEvent(adding: false));
              }
            },
            builder: (context, stateWish) =>
                BlocConsumer<UserWishListsBloc, UserWishListsState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state.favoritesStatus.isSubmissionInProgress) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                if (state.favoritesStatus.isSubmissionSuccess) {
                  return state.favorites.isNotEmpty
                      ? AnimatedList(
                          key: listkey,
                          initialItemCount: state.favorites.length,
                          itemBuilder: (context, index, animation) {
                            final item = state.favorites[index];
                            return Padding(
                                padding: EdgeInsets.only(
                                    top: index == 0 ? 16 : 0, bottom: 12),
                                child: FavoriteItem(
                                    animation: animation,
                                    gallery: item.gallery,
                                    carModelName: item.model.name,
                                    carYear: item.year,
                                    contactPhone: item.contactPhone,
                                    description: item.description,
                                    districtTitle: item.district.title,
                                    isNew: item.isNew,
                                    isWishlisted: item.isWishlisted,
                                    price: item.price,
                                    currency: item.currency,
                                    publishedAt: item.publishedAt,
                                    userFullName: item.user.fullName,
                                    userImage: item.user.image,
                                    userType: item.userType,
                                    hasComparison: item.isComparison,
                                    callFrom: item.contactAvailableFrom,
                                    callTo: item.contactAvailableTo,
                                    discount: item.discount,
                                    id: item.id,
                                    index: index,
                                    onTap: () {
                                      context.read<WishlistAddBloc>().add(
                                          WishlistAddEvent.removeWishlist(
                                              state.favorites[index].id,
                                              index));
                                    }));
                          })
                      : const Center(
                          child: EmptyItemBody(
                              subtitle: 'У вас еще нет объявлений',
                              image: AppIcons.carIcon),
                        );
                }
                return const Center(child: Text('Xatolik'));
              },
            ),
          ),
        ),
      );
}





// onTapLike: () {
                                 
//                                 },