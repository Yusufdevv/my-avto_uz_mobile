import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/dealers/data/datasource/cars_in_marks_datasource.dart';
import 'package:auto/features/dealers/data/repositories/cars_in_marks_repository.dart';
import 'package:auto/features/dealers/domain/usecases/cars_in_marks_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/cars_in_marks_bloc/cars_in_marks_bloc.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SingleMarkAnnouncements extends StatefulWidget {
  final String carMark;
  final String dealerSlug;
  final String markSlug;

  const SingleMarkAnnouncements(
      {required this.carMark,
      required this.dealerSlug,
      required this.markSlug,
      Key? key})
      : super(key: key);

  @override
  State<SingleMarkAnnouncements> createState() =>
      _SingleMarkAnnouncementsState();
}

class _SingleMarkAnnouncementsState extends State<SingleMarkAnnouncements> {
  late CarsInMarksBloc carsInMarksBloc;
  late CarMarkParams param =
      CarMarkParams(dealer: widget.dealerSlug, mark: widget.markSlug);

  @override
  void initState() {
    carsInMarksBloc = CarsInMarksBloc(
      carsInMarksUseCase: CarsInMarksUseCase(
        cars: CarsInMarksRepositoryImpl(
          dataSource: CarsInMarksDataSource(DioSettings().dio),
        ),
      ),
    )..add(CarsInMarksEvent.getResults(params: param));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: carsInMarksBloc,
        child: Scaffold(
          appBar: WAppBar(
            extraActions: [
              Text(widget.carMark,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
              const Spacer(
                flex: 120,
              ),
            ],
          ),
          body: BlocBuilder<CarsInMarksBloc, CarsInMarksState>(
              builder: (context, carsInMarksState) {
            if (carsInMarksState.status.isSubmissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (carsInMarksState.status.isSubmissionSuccess) {
              return Paginator(
                  paginatorStatus: carsInMarksState.status,
                  itemBuilder: (context, index) {
                    final item = carsInMarksState.cars[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context, rootNavigator: true)
                              .push(fade(page: CarSingleScreen(id: item.id)));
                        },
                        child: InfoContainer(
                          index: index,
                          avatarPicture: item.userType == 'owner'
                              ? item.user.avatar
                              : item.dealer.avatar,
                          carModel: item.absoluteCarName,
                          hasDiscount: false,
                          location: item.region.title,
                          owner: item.user.fullName,
                          ownerType: item.userType,
                          publishTime:
                              MyFunctions.getAutoPublishDate(item.createdAt),
                          subtitle: item.description,
                          year: item.year,
                          price: double.parse(item.price),
                          discountPrice: double.parse(item.discount!='' ? item.discount : '0'),
                          sellType: item.isRentWithPurchase
                              ? LocaleKeys.rent_to_buy.tr()
                              : LocaleKeys.car_sale.tr(),
                          hasStatusInfo: item.isNew,
                          gallery: item.gallery,
                          currency: item.currency,
                          initialLike: item.isWishlisted,
                          onTapFavorites: () {},
                          initialComparsions: item.isComparison,
                          id: item.id,
                        ),
                      ),
                    );
                  },
                  itemCount: carsInMarksState.cars.length,
                  loadingWidget: const CupertinoActivityIndicator(),
                  fetchMoreFunction: () {
                    final params = CarMarkParams(
                        dealer: widget.dealerSlug,
                        mark: widget.markSlug,
                        next: carsInMarksState.next);
                    carsInMarksBloc
                        .add(CarsInMarksEvent.getMoreResults(params: params));
                  },
                  hasMoreToFetch: carsInMarksState.moreFetch ?? false,
                  errorWidget: const SizedBox());
            }
            return const SizedBox();
          }),
        ),
      );
}
