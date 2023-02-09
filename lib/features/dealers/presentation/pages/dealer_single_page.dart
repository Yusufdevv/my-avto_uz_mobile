import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/dealers/data/datasource/cars_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/datasource/dealer_single_datasource.dart';
import 'package:auto/features/dealers/data/datasource/marks_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/repositories/cars_in_dealers_repository.dart';
import 'package:auto/features/dealers/data/repositories/dealer_single_repository_impl.dart';
import 'package:auto/features/dealers/data/repositories/marks_in_dealer_repository.dart';
import 'package:auto/features/dealers/domain/usecases/cars_in_dealers_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_single_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/marks_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/cars_in_dealer_bloc/cars_in_dealer_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_single_bloc/dealer_single_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/marks_in_dealer_bloc/marks_in_dealers_bloc.dart';
import 'package:auto/features/dealers/presentation/pages/all_cars_in_dealer_screen.dart';
import 'package:auto/features/dealers/presentation/pages/all_marks_with_announcements.dart';
import 'package:auto/features/dealers/presentation/pages/single_mark_announcements.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_sliver_delegate.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_single_info_part.dart';
import 'package:auto/features/dealers/presentation/widgets/mark_with_announcement.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

// ignore: must_be_immutable
class DealerSinglePage extends StatefulWidget {
  //final String dealerType;
  final String slug;

  const DealerSinglePage({
    //required this.dealerType,
    required this.slug,
  });

  @override
  State<DealerSinglePage> createState() => _DealerSinglePageState();
}

class _DealerSinglePageState extends State<DealerSinglePage> {
  late DealerSingleBloc dealerSingleBloc;
  late MarksInDealersBloc marksBloc;
  late CarsInDealerBloc carsBloc;

  @override
  void initState() {
    dealerSingleBloc = DealerSingleBloc()
      ..add(DealerSingleEvent.getResults(slug: widget.slug));
    marksBloc = MarksInDealersBloc(
        marksInDealerUseCase: MarksInDealerUseCase(
            marks: MarksInDealerRepositoryImpl(
                dataSource: MarksInDealerDataSource(DioSettings().dio))))
      ..add(MarksInDealersEvent.getResults(slug: widget.slug));
    carsBloc = CarsInDealerBloc(
        carsInDealerUseCase: CarsInDealerUseCase(
            cars: CarsInDealerRepositoryImpl(
                dataSource: CarsInDealerDataSource(DioSettings().dio))))
      ..add(CarsInDealerEvent.getResults(slug: widget.slug));
    super.initState();
  }

  @override
  void dispose() {
    dealerSingleBloc.close();
    marksBloc.close();
    carsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: dealerSingleBloc),
          BlocProvider.value(value: marksBloc),
          BlocProvider.value(value: carsBloc),
        ],
        child: Scaffold(
          body: BlocBuilder<DealerSingleBloc, DealerSingleState>(
            builder: (context, dealerSingleState) {
              if (dealerSingleState.status.isSubmissionSuccess) {
                final dealer = dealerSingleState.dealerSingleEntity;
                return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>
                      <Widget>[
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SellerSliverDelegate(
                          gallery: dealer.gallery,
                          avatarImage: dealer.avatar,
                          dealerName: dealer.name,
                          minHeight: MediaQuery.of(context).size.height * 0.11,
                          showroomOrPerson: LocaleKeys.autosalon.tr()),
                    ),
                  ],
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: DealerSingleInfoPart(
                            daelerId: dealer.id,
                            dealerSingleBloc: dealerSingleBloc,
                            dealerName: dealer.name,
                            quantityOfCars: dealer.carCount,
                            contactFrom: dealer.contactFrom,
                            contactTo: dealer.contactTo,
                            contact: dealer.phoneNumber,
                            additionalInfo: dealer.description,
                            longitude: dealer.longitude,
                            latitude: dealer.latitude,
                          ),
                        ),
                        BlocBuilder<MarksInDealersBloc, MarksInDealersState>(
                            builder: (context, allMarksState) => allMarksState
                                    .status.isSubmissionSuccess
                                ? allMarksState.marks.length > 10
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 12, left: 16, right: 16),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                LocaleKeys.all_brands_with_ads
                                                    .tr(),
                                                style: const TextStyle(
                                                  color: orange,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    fade(
                                                        page:
                                                            BlocProvider.value(
                                                      value: marksBloc,
                                                      child:
                                                          AllMarksWithAnnouncements(
                                                        slug: widget.slug,
                                                      ),
                                                    )));
                                              },
                                              behavior: HitTestBehavior.opaque,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    LocaleKeys.all.tr(),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: greyText),
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  SvgPicture.asset(
                                                      AppIcons
                                                          .chevronRightBlack,
                                                      color: greyText)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : const SizedBox()
                                : const SizedBox()),
                        BlocBuilder<MarksInDealersBloc, MarksInDealersState>(
                            builder: (context, marksInDealerState) =>
                                marksInDealerState.status.isSubmissionSuccess
                                    ? marksInDealerState.marks.isNotEmpty
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16),
                                            child: SizedBox(
                                                height: 88,
                                                child: Paginator(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  paginatorStatus:
                                                      marksInDealerState.status,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        fade(
                                                          page:
                                                              SingleMarkAnnouncements(
                                                            dealerSlug:
                                                                widget.slug,
                                                            markSlug:
                                                                marksInDealerState
                                                                    .marks[
                                                                        index]
                                                                    .make
                                                                    .slug,
                                                            carMark:
                                                                marksInDealerState
                                                                    .marks[
                                                                        index]
                                                                    .make
                                                                    .name,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child:
                                                        MarksWithAnnouncements(
                                                      quantity:
                                                          marksInDealerState
                                                              .marks[index]
                                                              .carsCount,
                                                      imageUrl:
                                                          marksInDealerState
                                                              .marks[index]
                                                              .make
                                                              .logo,
                                                      mark: marksInDealerState
                                                          .marks[index]
                                                          .make
                                                          .name,
                                                    ),
                                                  ),
                                                  itemCount: marksInDealerState
                                                      .marks.length,
                                                  fetchMoreFunction: () {
                                                    marksBloc.add(
                                                        MarksInDealersEvent
                                                            .getMoreResults(
                                                                slug: widget
                                                                    .slug));
                                                  },
                                                  hasMoreToFetch:
                                                      marksInDealerState
                                                              .moreFetch ??
                                                          false,
                                                  errorWidget: const SizedBox(),
                                                  loadingWidget:
                                                      const CupertinoActivityIndicator(),
                                                )),
                                          )
                                        : const SizedBox()
                                    : const SizedBox()),
                        BlocBuilder<CarsInDealerBloc, CarsInDealerState>(
                            builder: (context, allCarsState) => allCarsState
                                    .status.isSubmissionSuccess
                                ? allCarsState.cars.length > 10
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 12, left: 16, right: 16),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    LocaleKeys.cars.tr(
                                                        args: [dealer.name]),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                        color: orange,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                            GestureDetector(
                                              onTap: () => Navigator.push(
                                                context,
                                                fade(
                                                  page: BlocProvider(
                                                    create: (context) =>
                                                        carsBloc,
                                                    child:
                                                        AllCarsInDealerScreen(
                                                            slug: widget.slug),
                                                  ),
                                                ),
                                              ),
                                              behavior: HitTestBehavior.opaque,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    LocaleKeys.all.tr(),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: greyText),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  SvgPicture.asset(
                                                      AppIcons
                                                          .chevronRightBlack,
                                                      color: greyText)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : const SizedBox()
                                : const SizedBox()),
                        BlocBuilder<CarsInDealerBloc, CarsInDealerState>(
                            builder: (context, carsInDealerState) =>
                                carsInDealerState.status.isSubmissionSuccess
                                    ? carsInDealerState.cars.isNotEmpty
                                        ? SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.33,
                                            child: Paginator(
                                              hasMoreToFetch:
                                                  carsInDealerState.moreFetch ??
                                                      false,
                                              fetchMoreFunction: () {
                                                carsBloc.add(CarsInDealerEvent
                                                    .getMoreResults(
                                                        slug: widget.slug));
                                              },
                                              paginatorStatus:
                                                  carsInDealerState.status,
                                              errorWidget: const SizedBox(),
                                              padding: const EdgeInsets.only(
                                                  left: 16),
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(width: 16),
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  BlocConsumer<WishlistAddBloc,
                                                      WishlistAddState>(
                                                listener: (context, stateWish) {
                                                  if (stateWish.addStatus
                                                          .isSubmissionSuccess ||
                                                      stateWish.removeStatus
                                                          .isSubmissionSuccess) {
                                                    if (stateWish.id ==
                                                        carsInDealerState
                                                            .cars[index].id) {
                                                      context
                                                          .read<
                                                              CarsInDealerBloc>()
                                                          .add(CarsInDealerEvent
                                                              .changeIsWish(
                                                                  index:
                                                                      stateWish
                                                                          .index,
                                                                  id: stateWish
                                                                      .id));
                                                    }
                                                    context
                                                        .read<WishlistAddBloc>()
                                                        .add(WishlistAddEvent
                                                            .clearState());
                                                  }
                                                },
                                                builder:
                                                    (context, stateWishBuild) =>
                                                        AdsItem(
                                                  id: carsInDealerState
                                                      .cars[index].id,
                                                  image: carsInDealerState
                                                          .cars[index]
                                                          .gallery
                                                          .isNotEmpty
                                                      ? carsInDealerState
                                                          .cars[index]
                                                          .gallery
                                                          .first
                                                      : '',
                                                  name: carsInDealerState
                                                      .cars[index]
                                                      .absoluteCarName,
                                                  currency: carsInDealerState
                                                      .cars[index].currency,
                                                  description: carsInDealerState
                                                      .cars[index].description,
                                                  isLiked: carsInDealerState
                                                      .cars[index].isWishlisted,
                                                  location: carsInDealerState
                                                      .cars[index].region.title,
                                                  onTapLike: () {
                                                    context
                                                        .read<WishlistAddBloc>()
                                                        .add(carsInDealerState
                                                                .cars[index]
                                                                .isWishlisted
                                                            ? WishlistAddEvent
                                                                .removeWishlist(
                                                                    carsInDealerState
                                                                        .cars[
                                                                            index]
                                                                        .id,
                                                                    index)
                                                            : WishlistAddEvent
                                                                .addWishlist(
                                                                    carsInDealerState
                                                                        .cars[
                                                                            index]
                                                                        .id,
                                                                    index));
                                                  },
                                                  price: carsInDealerState
                                                      .cars[index].price,
                                                ),
                                              ),
                                              itemCount:
                                                  carsInDealerState.cars.length,
                                            ),
                                          )
                                        : const SizedBox()
                                    : const SizedBox()),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      );
}
