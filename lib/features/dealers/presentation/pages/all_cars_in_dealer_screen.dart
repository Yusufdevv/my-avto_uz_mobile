import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/dealers/data/datasource/dealer_single_datasource.dart';
import 'package:auto/features/dealers/data/repositories/dealer_single_repository.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_single_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/cars_in_dealer_bloc/cars_in_dealer_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_single_bloc/dealer_single_bloc.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AllCarsInDealerScreen extends StatelessWidget {
  final String slug;

  const AllCarsInDealerScreen({
    required this.slug,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: WAppBar(
          extraActions: [
            Text(LocaleKeys.all_cars.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
            const Spacer(
              flex: 120,
            ),
          ],
        ),
        body: BlocBuilder<CarsInDealerBloc, CarsInDealerState>(
            builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state.status.isSubmissionSuccess) {
            return Paginator(
              paginatorStatus: state.status,
              itemBuilder: (context, index) {
                final item = state.cars[index];
                return BlocListener<WishlistAddBloc, WishlistAddState>(
                  listener: (context, stateWish) {
                    if (stateWish.addStatus.isSubmissionSuccess ||
                          stateWish.removeStatus.isSubmissionSuccess) {
                        if (stateWish.id == item.id) {
                          // context.read<TopAdBloc>().add(TopAdEvent.changeIsWish(
                          //     index: stateWish.index, id: stateWish.id));
                        }
                        // context
                        //     .read<WishlistAddBloc>()
                        //     .add(WishlistAddEvent.clearState());
                      }
                  },
                  child: Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: InfoContainer(
                                    index: index,
                                    avatarPicture: item.userType == 'owner'
                                        ? item.user.avatar
                                        : item.dealer.avatar,
                                    carModel: item.absoluteCarName,
                                    hasDiscount: double.parse(item.discount) > 0,
                                    location: item.region.title,
                                    owner: item.absoluteCarName,
                                    ownerType: item.userType,
                                    publishTime: MyFunctions.getAutoPublishDate(item.createdAt),
                                    subtitle: item.description,
                                    year: item.year,
                                    price: item.price,
                                    discountPrice: item.price,
                                    sellType: item.currency,
                                    hasStatusInfo: item.isNew,
                                    gallery: item.gallery,
                                    currency: item.currency,
                                    initialLike: item.isWishlisted,
                                    onTapFavorites: () {
                                    },
                                    onTapComparsion: () {},
                                    initialComparsions: item.isComparison,
                                    id: item.id,
                                  ),
                                ),
                );
              },
              itemCount: state.cars.length,
              fetchMoreFunction: () {
                context
                    .read<CarsInDealerBloc>()
                    .add(CarsInDealerEvent.getMoreResults(slug: slug));
              },
              hasMoreToFetch: state.moreFetch ?? false,
              errorWidget: const SizedBox(),
              loadingWidget: const CupertinoActivityIndicator(),
            );
          }
          return const SizedBox();
        }),
      );
}
