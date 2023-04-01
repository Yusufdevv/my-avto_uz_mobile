import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/dealers/data/datasource/cars_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/datasource/marks_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/repositories/cars_in_dealers_repository.dart';
import 'package:auto/features/dealers/data/repositories/marks_in_dealer_repository.dart';
import 'package:auto/features/dealers/domain/usecases/cars_in_dealers_usecase.dart';
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
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

// ignore: must_be_immutable
class DealerSinglePage extends StatefulWidget {
  final String? workingDays;
  final String slug;

  const DealerSinglePage({
    required this.slug,
    this.workingDays,
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
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor:
                Theme.of(context).extension<ThemedColors>()!.whiteToBlack,
            body: BlocBuilder<DealerSingleBloc, DealerSingleState>(
              builder: (context, dealerSingleState) {
                if (dealerSingleState.status.isSubmissionInProgress) {
                  return const Center(child: CupertinoActivityIndicator());
                } else if (dealerSingleState.status.isSubmissionSuccess) {
                  final dealer = dealerSingleState.dealerSingleEntity;
                  return CustomScrollView(
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: SellerSliverDelegate(
                            gallery: dealer.gallery,
                            avatarImage: dealer.avatar,
                            dealerName: dealer.name,
                            minHeight:
                                MediaQuery.of(context).size.height * 0.11,
                            showroomOrPerson: LocaleKeys.autosalon.tr()),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: DealerSingleInfoPart(
                                mapBox: MapBox(
                                  dealerId: dealer.id,
                                  dealerName: dealer.name,
                                  latitude: dealer.latitude,
                                  longitude: dealer.longitude,
                                ),
                                workingDays: widget.workingDays,
                                address: dealer.address,
                                daelerId: dealer.id,
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
                            BlocBuilder<MarksInDealersBloc,
                                    MarksInDealersState>(
                                builder: (context, allMarksState) =>
                                    allMarksState.status.isSubmissionSuccess
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (allMarksState.marks.length >
                                                  9)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 12,
                                                          left: 16,
                                                          right: 16),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          LocaleKeys
                                                              .all_brands_with_ads
                                                              .tr(),
                                                          style:
                                                              const TextStyle(
                                                            color: orange,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              fade(
                                                                  page:
                                                                      BlocProvider
                                                                          .value(
                                                                value:
                                                                    marksBloc,
                                                                child: AllMarksWithAnnouncements(
                                                                    slug: widget
                                                                        .slug),
                                                              )));
                                                        },
                                                        behavior:
                                                            HitTestBehavior
                                                                .opaque,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              LocaleKeys.all
                                                                  .tr(),
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      greyText),
                                                            ),
                                                            const SizedBox(
                                                                width: 4),
                                                            SvgPicture.asset(
                                                                AppIcons
                                                                    .chevronRightBlack,
                                                                color: greyText)
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              if (allMarksState
                                                  .marks.isNotEmpty)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                          allMarksState.status,
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
                                                                    allMarksState
                                                                        .marks[
                                                                            index]
                                                                        .make
                                                                        .slug,
                                                                carMark:
                                                                    allMarksState
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
                                                              allMarksState
                                                                  .marks[index]
                                                                  .carsCount,
                                                          imageUrl:
                                                              allMarksState
                                                                  .marks[index]
                                                                  .make
                                                                  .logo,
                                                          mark: allMarksState
                                                              .marks[index]
                                                              .make
                                                              .name,
                                                        ),
                                                      ),
                                                      itemCount: allMarksState
                                                          .marks.length,
                                                      fetchMoreFunction: () {
                                                        marksBloc.add(
                                                            MarksInDealersEvent
                                                                .getMoreResults(
                                                                    slug: widget
                                                                        .slug));
                                                      },
                                                      hasMoreToFetch:
                                                          allMarksState
                                                                  .moreFetch ??
                                                              false,
                                                      errorWidget:
                                                          const SizedBox(),
                                                      loadingWidget:
                                                          const CupertinoActivityIndicator(),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          )
                                        : const SizedBox()),
                            BlocBuilder<CarsInDealerBloc, CarsInDealerState>(
                                builder: (context, allCarsState) => allCarsState
                                        .status.isSubmissionSuccess
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (allCarsState.cars.length > 9)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 12,
                                                  left: 16,
                                                  right: 16),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                          LocaleKeys.cars.tr(
                                                              args: [
                                                                dealer.name
                                                              ]),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                              color: orange,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))),
                                                  GestureDetector(
                                                    onTap: () => Navigator.push(
                                                      context,
                                                      fade(
                                                        page: BlocProvider(
                                                          create: (context) =>
                                                              carsBloc,
                                                          child:
                                                              AllCarsInDealerScreen(
                                                                  slug: widget
                                                                      .slug),
                                                        ),
                                                      ),
                                                    ),
                                                    behavior:
                                                        HitTestBehavior.opaque,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          LocaleKeys.all.tr(),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      greyText),
                                                        ),
                                                        const SizedBox(
                                                            width: 4),
                                                        SvgPicture.asset(
                                                            AppIcons
                                                                .chevronRightBlack,
                                                            color: greyText)
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          if (allCarsState.cars.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20),
                                              child: SizedBox(
                                                height: 293,
                                                child: Paginator(
                                                  hasMoreToFetch:
                                                      allCarsState.moreFetch ??
                                                          false,
                                                  fetchMoreFunction: () {
                                                    carsBloc.add(
                                                        CarsInDealerEvent
                                                            .getMoreResults(
                                                                slug: widget
                                                                    .slug));
                                                  },
                                                  paginatorStatus:
                                                      allCarsState.status,
                                                  errorWidget: const SizedBox(),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16),
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  separatorBuilder: (context,
                                                          index) =>
                                                      const SizedBox(width: 16),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          BlocConsumer<
                                                              WishlistAddBloc,
                                                              WishlistAddState>(
                                                    listener:
                                                        (context, stateWish) {
                                                      if (stateWish.addStatus
                                                              .isSubmissionSuccess ||
                                                          stateWish.removeStatus
                                                              .isSubmissionSuccess) {
                                                        if (stateWish.id ==
                                                            allCarsState
                                                                .cars[index]
                                                                .id) {
                                                          context
                                                              .read<
                                                                  CarsInDealerBloc>()
                                                              .add(CarsInDealerEvent
                                                                  .changeIsWish(
                                                                      index: stateWish
                                                                          .index,
                                                                      id: stateWish
                                                                          .id));
                                                        }
                                                        context
                                                            .read<
                                                                WishlistAddBloc>()
                                                            .add(WishlistAddEvent
                                                                .clearState());
                                                      }
                                                    },
                                                    builder: (context,
                                                            stateWishBuild) =>
                                                        AdsItem(
                                                      id: allCarsState
                                                          .cars[index].id,
                                                      image: allCarsState
                                                              .cars[index]
                                                              .gallery
                                                              .isNotEmpty
                                                          ? allCarsState
                                                              .cars[index]
                                                              .gallery
                                                              .first
                                                          : '',
                                                      name: allCarsState
                                                          .cars[index]
                                                          .absoluteCarName,
                                                      currency: allCarsState
                                                          .cars[index].currency,
                                                      description: allCarsState
                                                          .cars[index]
                                                          .description,
                                                      isLiked: allCarsState
                                                          .cars[index]
                                                          .isWishlisted,
                                                      location: allCarsState
                                                          .cars[index]
                                                          .region
                                                          .title,
                                                      onTapLike: () {
                                                        context.read<WishlistAddBloc>().add(allCarsState
                                                                .cars[index]
                                                                .isWishlisted
                                                            ? WishlistAddEvent
                                                                .removeWishlist(
                                                                    allCarsState
                                                                        .cars[
                                                                            index]
                                                                        .id,
                                                                    index)
                                                            : WishlistAddEvent
                                                                .addWishlist(
                                                                    allCarsState
                                                                        .cars[
                                                                            index]
                                                                        .id,
                                                                    index));
                                                      },
                                                      price: allCarsState
                                                          .cars[index].price,
                                                    ),
                                                  ),
                                                  itemCount:
                                                      allCarsState.cars.length,
                                                ),
                                              ),
                                            )
                                        ],
                                      )
                                    : const SizedBox()),
                          ],
                        ),
                      )
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      );
}
