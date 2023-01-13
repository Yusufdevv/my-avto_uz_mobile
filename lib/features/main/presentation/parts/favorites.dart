import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/main/presentation/bloc/top_ad/top_ad_bloc.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
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
        builder: (context, state) => Visibility(
          visible: state.favoritesStatus.isSubmissionInProgress ||
              state.favoritesStatus.isSubmissionSuccess &&
                  state.favorites.isNotEmpty,
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
                    context.read<TopAdBloc>().add(TopAdEvent.deleteFavoriteItem(
                         id: stateWish.id, adding: true));
                    context
                        .read<WishlistAddBloc>()
                        .add(WishlistAddEvent.clearState());
                  }
                  if (stateWish.removeStatus.isSubmissionSuccess) {
                    context.read<TopAdBloc>().add(TopAdEvent.deleteFavoriteItem(
                         id: stateWish.id, adding: false));
                  }
                  
                },
                builder: (context, stateWish) => SizedBox(
                  height: (!state.favoritesStatus.isSubmissionInProgress &&
                          state.favorites.isEmpty)
                      ? null
                      : MediaQuery.of(context).size.height * 0.34,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) => state
                            .favoritesStatus.isSubmissionInProgress
                        ? BrandShimmerItem()
                        : state.favorites.isEmpty
                            ? const FavouriteItem()
                            // ignore: prefer_expression_function_bodies
                            : Builder(builder: (context) {
                              favorites = state.favorites;
                                return AdsItem(
                                  id: state.favorites[index].id,
                                  name: state.favorites[index].make.name,
                                  price:
                                      state.favorites[index].price.toString(),
                                  location: state.favorites[index].region.title,
                                  description:
                                      state.favorites[index].description,
                                  image:
                                      state.favorites[index].gallery.isNotEmpty
                                          ? state.favorites[index].gallery.first
                                          : '',
                                  currency: state.favorites[index].currency,
                                  isLiked: state.favorites[index].isWishlisted,
                                  onTapLike: () {
                                    context.read<WishlistAddBloc>().add(WishlistAddEvent.removeWishlist(
                                            state.favorites[index].id, index)
                                       );
                                  },
                                );
                              }),
                    itemCount: state.status.isSubmissionInProgress
                        ? 5
                        : state.favorites.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 24),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
}
