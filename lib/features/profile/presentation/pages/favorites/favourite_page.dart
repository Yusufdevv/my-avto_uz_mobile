import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';
import 'package:auto/features/profile/domain/usecases/get_my_searches_usecase.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_single.dart';
import 'package:auto/features/profile/domain/usecases/get_notification_usecase.dart';
import 'package:auto/features/profile/domain/usecases/profil_favorites_usecase.dart';
import 'package:auto/features/profile/presentation/bloc/user_wishlists_notifications/user_wishlists_notification_bloc.dart';
import 'package:auto/features/profile/presentation/widgets/empty_item_body.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

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

  List favorites = [];

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: WAppBar(
            title: LocaleKeys.favorites.tr(),
            centerTitle: false,
          ),
          body: BlocBuilder<UserWishListsBloc, UserWishListsState>(
            builder: (context, state) {
              if (state.favoritesStatus.isSubmissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (state.favoritesStatus.isSubmissionSuccess) {
                favorites = state.favorites;
                return favorites.isNotEmpty
                    ? ListView.builder(
                        itemCount: favorites.length,
                        itemBuilder: (context, index) {
                          final item = favorites[index];
                          bool isLiked = item.isWishlisted;
                          return Padding(
                            padding: EdgeInsets.only(
                                top: index == 0 ? 16 : 0, bottom: 12),
                            child: InfoContainer(
                              avatarPicture: item.user.image,
                              carModel: item.model.name,
                              hasDiscount: item.discount != 0,
                              location: item.region.title,
                              owner: item.contactName.isNotEmpty
                                  ? item.contactName
                                  : item.user.fullName,
                              ownerType: item.userType,
                              publishTime: MyFunctions.getDateNamedMonthEdit(
                                  item.publishedAt),
                              subtitle: item.description,
                              year: item.year,
                              price: item.price.toString(),
                              discountPrice: item.discount == 0
                                  ? ''
                                  : item.discount.toString(),
                              sellType: '',
                              hasStatusInfo: false,
                              hasCallCard: MyFunctions.enableForCalling(
                                callFrom: item.contactAvailableFrom,
                                callTo: item.contactAvailableTo,
                              ),
                              gallery: item.gallery,
                              currency: item.currency,
                              initialLike: isLiked,
                              id: item.id,
                              initialComparsions: item.isComparison,
                              onTapComparsion: () {},
                              onTapFavorites: () {
                                favorites.remove(item);
                                if (!isLiked) {
                                  context.read<WishlistAddBloc>().add(
                                      WishlistAddEvent.addWishlist(
                                          item.id, index));
                                  isLiked = true;
                                } else {
                                  context.read<WishlistAddBloc>().add(
                                      WishlistAddEvent.removeWishlist(
                                          item.id, index));
                                  isLiked = false;
                                }
                                setState(() {});
                              },
                            ),
                          );
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
      );
}
