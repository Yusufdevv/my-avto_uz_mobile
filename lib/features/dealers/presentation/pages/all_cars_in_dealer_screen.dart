import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/dealers/presentation/blocs/cars_in_dealer_bloc/cars_in_dealer_bloc.dart'; 
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
          textWithButton: LocaleKeys.all_cars.tr(),
        ),
        body: BlocBuilder<CarsInDealerBloc, CarsInDealerState>(
            builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state.status.isSubmissionSuccess) {
            return Paginator(
              paginatorStatus: state.status,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (context, index) {
                final item = state.cars[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InfoContainer(
                    index: index,
                    avatarPicture: item.userType == 'owner'
                        ? item.user.avatar
                        : item.dealer.avatar,
                    carModel: item.absoluteCarName,
                    // ignore: avoid_bool_literals_in_conditional_expressions
                    hasDiscount: item.discount.isEmpty
                        ? false
                        : double.parse(item.discount) > 0,
                    location: item.region.title,
                    owner: item.absoluteCarName,
                    ownerType: item.userType,
                    publishTime: MyFunctions.getAutoPublishDate(item.createdAt),
                    subtitle: item.description,
                    year: item.year,
                    price: item.price,
                    discountPrice: item.price,
                                                              sellType: item.isRentWithPurchase ? LocaleKeys.rent_to_buy.tr() : LocaleKeys.car_sale.tr(),

                    hasStatusInfo: item.isNew,
                    gallery: item.gallery,
                    currency: item.currency,
                    initialLike: item.isWishlisted,
                    onTapFavorites: () {},
                    onTapComparsion: () {},
                    initialComparsions: item.isComparison,
                    id: item.id,
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
