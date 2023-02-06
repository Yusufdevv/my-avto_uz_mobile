import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/main/presentation/bloc/top_ad/top_ad_bloc.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/main/presentation/widgets/main_empty_favourite.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// ignore: must_be_immutable
class MainFavorites extends StatelessWidget {
  MainFavorites({required this.parentContext, Key? key}) : super(key: key);
  final BuildContext parentContext;

  late List<AutoEntity> favorites;
  final GlobalKey<AnimatedListState> listkey = GlobalKey();

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
                      ? MainEmptyFavourite(parentContext: parentContext)
                      : SizedBox(
                          height: 298,
                          child: AnimatedList(
                            key: listkey,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 16, right: 16, left: 16),
                            itemBuilder: (context, index, animation) {
                              if (index == state.favorites.length) {
                                if (state.nextF != null) {
                                  context
                                      .read<TopAdBloc>()
                                      .add(TopAdEvent.getMoreFavorite());
                                  return const Center(
                                      child: CupertinoActivityIndicator());
                                } else {
                                  return const SizedBox();
                                }
                              }
                              return BlocListener<WishlistAddBloc,
                                  WishlistAddState>(
                                listener: (context, stateWish) {
                                  if (stateWish
                                          .removeStatus.isSubmissionSuccess &&
                                      stateWish.id ==
                                          state.favorites[index].id) {
                                    listkey.currentState?.removeItem(
                                      index,
                                      (context, animation) => SlideTransition(
                                        key: UniqueKey(),
                                        position: Tween(
                                                begin: const Offset(-1, 0),
                                                end: Offset.zero)
                                            .animate(CurvedAnimation(
                                                parent: animation,
                                                curve: Curves.easeInOut)),
                                        child: AdsItem(
                                          id: state.favorites[index].id,
                                          name:
                                              state.favorites[index].make.name,
                                          price: state.favorites[index].price
                                              .toString(),
                                          location: state
                                              .favorites[index].region.title,
                                          description: state
                                              .favorites[index].description,
                                          image: state.favorites[index].gallery
                                                  .isNotEmpty
                                              ? state.favorites[index].gallery
                                                  .first
                                              : '',
                                          currency:
                                              state.favorites[index].currency,
                                          isLiked: state
                                              .favorites[index].isWishlisted,
                                          onTapLike: () {},
                                        ),
                                      ),
                                    );
                                    context.read<TopAdBloc>().add(
                                        TopAdEvent.deleteFavoriteItem(
                                            id: stateWish.id, adding: false));
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 24),
                                  child: SlideTransition(
                                    key: UniqueKey(),
                                    position: Tween(
                                            begin: const Offset(-1, 0),
                                            end: Offset.zero)
                                        .animate(CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeInOut)),
                                    child: AdsItem(
                                      id: favorites[index].id,
                                      name: favorites[index].make.name,
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
                                    ),
                                  ),
                                ),
                              );
                            },
                            initialItemCount: state.favorites.length + 1,
                          ),
                        ),
                ),
              ],
            ),
          );
        },
      );
}
