import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/main/presentation/bloc/top_ad/top_ad_bloc.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/main/presentation/widgets/ads_shimmer.dart';
import 'package:auto/features/main/presentation/widgets/main_empty_favourite.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// ignore: must_be_immutable
class MainFavorites extends StatelessWidget {
  MainFavorites({required this.parentContext,Key? key}) : super(key: key);
  final BuildContext parentContext;

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
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Text(
                    LocaleKeys.favorites.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 18),
                  ),
                ),
                BlocBuilder<WishlistAddBloc, WishlistAddState>(
                  builder: (context, stateWish) => (state
                              .favoritesStatus.isSubmissionSuccess &&
                          state.favorites.isEmpty)
                      ?   MainEmptyFavourite(parentContext: parentContext,)
                      : SizedBox(
                          height: 298,
                          child: Paginator(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 16, right: 16, left: 16),
                            itemBuilder: (context, index) => Builder(
                                builder: (context) => AdsItem(
                                      id: favorites[index].id,
                                      name: '${favorites[index].make.name} ${favorites[index].model.name} ${favorites[index].generation.name}',
                                      price: favorites[index].price.toString(),
                                      location: favorites[index].region.title,
                                      description: favorites[index].description,
                                      image: state.favorites[index].gallery
                                              .isNotEmpty
                                          ? favorites[index].gallery.first
                                          : '',
                                      currency: favorites[index].currency,
                                      isLiked: favorites[index].isWishlisted,
                                      onTapLike: () {
                                        context
                                            .read<WishlistAddBloc>()
                                            .add(WishlistAddEvent.clearState());
                                        context.read<WishlistAddBloc>().add(
                                            WishlistAddEvent.removeWishlist(
                                                favorites[index].id, index));
                                      },
                                    )),
                            itemCount: state.favorites.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 24),
                            errorWidget: const SizedBox(),
                            fetchMoreFunction: () {
                              context
                                  .read<TopAdBloc>()
                                  .add(TopAdEvent.getMoreFavorite());
                            },
                            hasMoreToFetch: state.nextF != null,
                            paginatorStatus: state.favoritesStatus,
                            loadingWidget: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 16, right: 16, left: 16),
                              itemBuilder: (context, index) => AdsShimmer(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 24),
                              itemCount: 2,
                            ),
                          ),
                        ),
                ),
                ],
            ),
          );
        },
      );
}

