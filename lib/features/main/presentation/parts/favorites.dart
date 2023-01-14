import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/main/presentation/bloc/top_ad/top_ad_bloc.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/main/presentation/widgets/ads_shimmer.dart';
import 'package:auto/features/main/presentation/widgets/brand_shimmer_item.dart';
import 'package:auto/features/main/presentation/widgets/favourite_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class Favorites extends StatelessWidget {
  Favorites({Key? key}) : super(key: key);

  late List<AutoEntity> favorites;
  @override
  Widget build(BuildContext context) => BlocConsumer<TopAdBloc, TopAdState>(
        listener: (context, state) {
          favorites = state.favorites;
        },
        builder: (context, state) {
          favorites = state.favorites;
          return Visibility(
            visible: state.favoritesStatus.isSubmissionInProgress ||
                state.favoritesStatus.isSubmissionSuccess,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    LocaleKeys.favorites.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 8),
                BlocConsumer<WishlistAddBloc, WishlistAddState>(
                  listener: (context, stateWish) {
                    if (stateWish.addStatus.isSubmissionSuccess) {
                      // context.read<TopAdBloc>().add(
                      //     TopAdEvent.deleteFavoriteItem(
                      //         id: stateWish.id, adding: true));

                    }
                    if (stateWish.removeStatus.isSubmissionSuccess) {
                      context
                          .read<WishlistAddBloc>()
                          .add(WishlistAddEvent.clearState());
                    }
                  },
                  builder: (context, stateWish) => (state
                              .favoritesStatus.isSubmissionSuccess &&
                          state.favorites.isEmpty)
                      ? const FavouriteItem()
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.34,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemBuilder: (context, index) =>
                                state.favoritesStatus.isSubmissionInProgress
                                    ? AdsShimmer()
                                    // ignore: prefer_expression_function_bodies
                                    : Builder(builder: (context) {
                                        var item = favorites[index];
                                        return AdsItem(
                                          id: item.id,
                                          name: item.make.name,
                                          price: item.price.toString(),
                                          location: item.region.title,
                                          description: item.description,
                                          image: state.favorites[index].gallery
                                                  .isNotEmpty
                                              ? item.gallery.first
                                              : '',
                                          currency: item.currency,
                                          isLiked: item.isWishlisted,
                                          onTapLike: () {
                                            context.read<WishlistAddBloc>().add(
                                                WishlistAddEvent.removeWishlist(
                                                    item.id, index));
                                            context.read<TopAdBloc>().add(
                                                TopAdEvent.deleteFavoriteItem(
                                                    id: item.id,
                                                    adding: false));
                                          },
                                        );
                                      }),
                            itemCount: state.status.isSubmissionInProgress
                                ? 2
                                : state.favorites.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 24),
                          ),
                        ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      );
}
