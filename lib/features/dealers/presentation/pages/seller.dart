import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/dealers/data/datasource/cars_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/datasource/dealer_single_datasource.dart';
import 'package:auto/features/dealers/data/datasource/marks_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/repositories/cars_in_dealers_repository.dart';
import 'package:auto/features/dealers/data/repositories/dealer_single_repository.dart';
import 'package:auto/features/dealers/data/repositories/marks_in_dealer_repository.dart';
import 'package:auto/features/dealers/domain/usecases/cars_in_dealers_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_single_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/marks_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/cars_in_dealer_bloc/cars_in_dealer_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_single_bloc/dealer_single_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/marks_in_dealer_bloc/marks_in_dealers_bloc.dart';
import 'package:auto/features/dealers/presentation/pages/all_cars_in_dealer_screen.dart';
import 'package:auto/features/dealers/presentation/pages/all_marks_with_announcements.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_sliver_delegate.dart';
import 'package:auto/features/dealers/presentation/widgets/mark_with_announcement.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Seller extends StatefulWidget {
  //final String dealerType;
  final String slug;
  bool isDirectoryPage;


    Seller({
    //required this.dealerType,
    required this.slug,
    this.isDirectoryPage=false,
  });

  @override
  State<Seller> createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  late DealerSingleBloc dealerSingleBloc;
  late MarksInDealersBloc marksBloc;
  late CarsInDealerBloc carsBloc;

  @override
  void initState() {
    dealerSingleBloc = DealerSingleBloc(
      dealerSingleUseCase: DealerSingleUseCase(
        dealerSingle: DealerSingleRepositoryImpl(
          dataSource: DealerSingleDataSource(DioSettings().dio),
        ),
      ),
    )..add(DealerSingleEvent.getResults(slug: widget.slug));
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
            builder: (context, dealerSingleState) => NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SellerSliverDelegate(
                      gallery: dealerSingleState.dealerSingleEntity.gallery,
                      avatarImage: dealerSingleState.dealerSingleEntity.avatar,
                      dealerName: dealerSingleState.dealerSingleEntity.name,
                      minHeight: MediaQuery.of(context).size.height * 0.11,
                      showroomOrPerson: 'Avtasalon'),
                ),
              ],
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SellerInfo(
                      //dealerType: dealerType,
                      dealerName: dealerSingleState.dealerSingleEntity.name,
                      quantityOfCars:
                          dealerSingleState.dealerSingleEntity.carCount,
                      contactFrom:
                          dealerSingleState.dealerSingleEntity.contactFrom,
                      contactTo: dealerSingleState.dealerSingleEntity.contactTo,
                      contact: dealerSingleState.dealerSingleEntity.phoneNumber,
                      additionalInfo:
                          dealerSingleState.dealerSingleEntity.description,
                      longitude: dealerSingleState.dealerSingleEntity.longitude,
                      latitude: dealerSingleState.dealerSingleEntity.latitude,
                    ),
                    BlocBuilder<MarksInDealersBloc, MarksInDealersState>(
                      builder: (context, allMarksState) => allMarksState
                              .marks.isNotEmpty
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      LocaleKeys.all_brands_with_ads.tr(),
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
                                              page: AllMarksWithAnnouncements(
                                            slug: widget.slug,
                                          )));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          LocaleKeys.all.tr(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: greyText),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        SvgPicture.asset(
                                            AppIcons.chevronRightBlack,
                                            color: greyText)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ),
                    BlocBuilder<MarksInDealersBloc, MarksInDealersState>(
                        builder: (context, marksInDealerState) =>
                            marksInDealerState.marks.isNotEmpty
                                ? SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        marksInDealerState.marks.length,
                                        (index) => MarksWithAnnouncements(
                                          quantity: marksInDealerState
                                              .marks[index].carsCount,
                                          imageUrl: marksInDealerState
                                              .marks[index].make.logo,
                                          mark: marksInDealerState
                                              .marks[index].make.name,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox()),
                    BlocBuilder<CarsInDealerBloc, CarsInDealerState>(
                      builder: (context, allCarsState) => allCarsState
                              .cars.isNotEmpty
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                          '${LocaleKeys.cars.tr()} от ${dealerSingleState.dealerSingleEntity.name}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              color: orange,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600))),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      fade(
                                        page: AllCarsInDealerScreen(slug: widget.slug),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          LocaleKeys.all.tr(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: greyText),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        SvgPicture.asset(
                                            AppIcons.chevronRightBlack,
                                            color: greyText)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ),
                    BlocBuilder<CarsInDealerBloc, CarsInDealerState>(
                      builder: (context, carsInDealerState) => carsInDealerState
                              .cars.isNotEmpty
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.36,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 16),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => AdsItem(
                                  id: carsInDealerState.cars[index].id,
                                  image: carsInDealerState
                                          .cars[index].gallery.isNotEmpty
                                      ? carsInDealerState
                                          .cars[index].gallery.first
                                      : '',
                                  name: carsInDealerState
                                      .cars[index].absoluteCarName,
                                  currency:
                                      carsInDealerState.cars[index].currency,
                                  description:
                                      carsInDealerState.cars[index].description,
                                  isLiked: true,
                                  location: carsInDealerState
                                      .cars[index].region.title,
                                  onTapLike: () {},
                                  price: carsInDealerState.cars[index].price,
                                ),
                                itemCount: carsInDealerState.cars.length,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
