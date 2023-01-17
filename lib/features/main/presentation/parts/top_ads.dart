import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/main/presentation/bloc/top_ad/top_ad_bloc.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/main/presentation/widgets/ads_shimmer.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class TopAds extends StatelessWidget {
  const TopAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<TopAdBloc, TopAdState>(
        builder: (context, state) => Visibility(
          visible: state.status.isSubmissionInProgress ||
              state.status.isSubmissionSuccess && state.topAds.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Text(LocaleKeys.best_offers.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18)),
              ),
              SizedBox(
                height: 293,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 16, right: 16, left: 16),
                    itemBuilder: (context, index) => state
                            .status.isSubmissionInProgress
                        ? AdsShimmer()
                        : BlocConsumer<WishlistAddBloc, WishlistAddState>(
                            listener: (context, stateWish) {
                              if (stateWish.addStatus.isSubmissionSuccess ||
                                  stateWish
                                      .removeStatus.isSubmissionSuccess) {
                                if (stateWish.id == state.topAds[index].id) {
                                  context.read<TopAdBloc>().add(
                                      TopAdEvent.changeIsWish(
                                          index: stateWish.index,
                                          id: stateWish.id));
                                }
                                context
                                    .read<WishlistAddBloc>()
                                    .add(WishlistAddEvent.clearState());
                              }
                            },
                            builder: (context, stateWish) => AdsItem(
                              id: state.topAds[index].id,
                              name: state.topAds[index].make,
                              price: state.topAds[index].price.toString(),
                              location: state.topAds[index].region,
                              description: state.topAds[index].description,
                              image: state.topAds[index].gallery.isNotEmpty
                                  ? state.topAds[index].gallery.first
                                  : '',
                              currency: state.topAds[index].currency,
                              isLiked: state.topAds[index].isWishlisted,
                              onTapLike: () {
                                context.read<WishlistAddBloc>().add(
                                    state.topAds[index].isWishlisted
                                        ? WishlistAddEvent.removeWishlist(
                                            state.topAds[index].id, index)
                                        : WishlistAddEvent.addWishlist(
                                            state.topAds[index].id, index));
                              },
                            ),
                          ),
                    itemCount: state.status.isSubmissionInProgress
                        ? 5
                        : state.topAds.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 24)),
              ),
            ],
          ),
        ),
      );
}
