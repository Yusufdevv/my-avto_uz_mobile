import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/profile/domain/entities/dealer_type_entity.dart';
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
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late UserWishListsBloc bloc;

  @override
  void initState() {
    bloc = UserWishListsBloc()..add(GetUserFavoritesEvent());
    super.initState();
  }

  final listkey = GlobalKey<AnimatedListState>();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

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
              return state.favorites.isNotEmpty
                  ? AnimatedList(
                      physics: const BouncingScrollPhysics(),
                      key: listkey,
                      initialItemCount: state.favorites.length + 1,
                      itemBuilder: (context, index, animation) {
                        if (index == state.favorites.length) {
                          if (state.moreFetchFavorites) {
                            bloc.add(GetMoreUserFavoritesEvent());
                            return const Center(
                                child: CupertinoActivityIndicator());
                          } else {
                            return const SizedBox();
                          }
                        }
                        final item = state.favorites[index];
                        final dealer = item.dealer != null
                            ? DealerFavEntity.fromJson(item.dealer)
                            : DealerFavEntity();
                        return Padding(
                            padding: EdgeInsets.only(
                                top: index == 0 ? 16 : 0, bottom: 12),
                            child: FavoriteItem(
                                sellType: item.isRentWithPurchase
                                    ? LocaleKeys.rent_to_buy.tr()
                                    : LocaleKeys.car_sale.tr(),
                                bloc: bloc,
                                animation: animation,
                                gallery: item.gallery,
                                carModelName:
                                    '${item.make.name} ${item.model.name} ${item.generation.name}',
                                carYear: item.year,
                                contactPhone: item.contactPhone,
                                description: item.description,
                                districtTitle: item.region.title,
                                isNew: item.isNew,
                                isWishlisted: item.isWishlisted,
                                price: item.price,
                                currency: item.currency,
                                publishedAt: item.publishedAt,
                                userFullName: item.userType == 'owner'
                                    ? item.user.fullName.isNotEmpty ? item.user.fullName: item.contactName  
                                    : dealer.name ?? '',
                                userImage: item.userType == 'owner'
                                    ? item.user.image
                                    : dealer.avatar ?? '',
                                userType: item.userType,
                                hasComparison: item.isComparison,
                                callFrom: item.userType == 'owner'
                                    ? item.contactAvailableFrom
                                    : dealer.contactFrom ?? '',
                                callTo: item.userType == 'owner'
                                    ? item.contactAvailableTo
                                    : dealer.contactTo ?? '',
                                discount: item.discount,
                                id: item.id,
                                index: index,
                                onTap: () {
                                  context.read<WishlistAddBloc>().add(
                                      WishlistAddEvent.removeWishlist(
                                          item.id, index));
                                  context.read<UserWishListsBloc>().add(
                                      ChangeIsWishEvenet(
                                          index: index, id: item.id));
                                  listkey.currentState?.removeItem(
                                      index,
                                      (context, animation) => FavoriteItem(
                                            sellType: item.isRentWithPurchase
                                                ? LocaleKeys.rent_to_buy.tr()
                                                : LocaleKeys.car_sale.tr(),
                                            bloc: bloc,
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
                                            userFullName:
                                                item.userType == 'owner'
                                                    ? item.user.fullName
                                                    : dealer.name ?? '',
                                            userImage: item.userType == 'owner'
                                                ? item.user.image
                                                : dealer.avatar ?? '',
                                            userType: item.userType,
                                            hasComparison: item.isComparison,
                                            callFrom: item.userType == 'owner'
                                                ? item.contactAvailableFrom
                                                : dealer.contactFrom ?? '',
                                            callTo: item.userType == 'owner'
                                                ? item.contactAvailableTo
                                                : dealer.contactTo ?? '',
                                            discount: item.discount,
                                            id: item.id,
                                            index: index,
                                          ),
                                      duration:
                                          const Duration(milliseconds: 600));
                                }));
                      })
                  : Center(
                      child: EmptyItemBody(
                          subtitle:
                              LocaleKeys.you_dont_have_featured_listings.tr(),
                          image: AppIcons.carIcon),
                    );
            }
            return Center(child: Text(LocaleKeys.error.tr()));
          },
        ),
      ));
}
