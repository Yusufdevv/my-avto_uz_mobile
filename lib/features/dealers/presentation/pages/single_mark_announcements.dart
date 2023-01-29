import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/dealers/data/datasource/cars_in_marks_datasource.dart';
import 'package:auto/features/dealers/data/datasource/dealer_single_datasource.dart';
import 'package:auto/features/dealers/data/repositories/cars_in_marks_repository.dart';
import 'package:auto/features/dealers/data/repositories/dealer_single_repository.dart';
import 'package:auto/features/dealers/domain/usecases/cars_in_marks_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_single_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/cars_in_marks_bloc/cars_in_marks_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_single_bloc/dealer_single_bloc.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late DealerSingleBloc dealerSingleBloc;
  late CarsInMarksBloc carsInMarksBloc;
  late CarMarkParams param =
      CarMarkParams(dealer: widget.dealerSlug, mark: widget.markSlug);

  @override
  void initState() {
    dealerSingleBloc = DealerSingleBloc(
      dealerSingleUseCase: DealerSingleUseCase(
        dealerSingle: DealerSingleRepositoryImpl(
          dataSource: DealerSingleDataSource(DioSettings().dio),
        ),
      ),
    )..add(DealerSingleEvent.getResults(slug: widget.dealerSlug));
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
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: dealerSingleBloc),
          BlocProvider.value(value: carsInMarksBloc),
        ],
        child: BlocBuilder<DealerSingleBloc, DealerSingleState>(
          builder: (context, dealerSingleState) => Scaffold(
            appBar: WAppBar(
              extraActions: [
                Text(widget.carMark,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                const Spacer(
                  flex: 120,
                ),
              ],
            ),
            body: BlocBuilder<CarsInMarksBloc, CarsInMarksState>(
              builder: (context, carsInMarksState) => ListView(
                children: [
                  ...List.generate(
                    carsInMarksState.cars.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InfoContainer(
                        index: index,
                        avatarPicture:
                            dealerSingleState.dealerSingleEntity.avatar,
                        carModel: carsInMarksState.cars[index].absoluteCarName,
                        hasDiscount: false,
                        location: carsInMarksState.cars[index].region.title,
                        owner: dealerSingleState.dealerSingleEntity.name,
                        ownerType: carsInMarksState.cars[index].ownership,
                        publishTime: MyFunctions.getAutoPublishDate(
                            carsInMarksState.cars[index].createdAt),
                        subtitle: carsInMarksState.cars[index].description,
                        year: carsInMarksState.cars[index].year,
                        price: carsInMarksState.cars[index].price,
                        discountPrice: carsInMarksState.cars[index].price,
                        sellType: 'Продажа Автомобиля',
                        hasStatusInfo: true,
                        hasCallCard: true,
                        gallery: carsInMarksState.cars[index].gallery,
                        currency: carsInMarksState.cars[index].currency,
                        initialLike: false,
                        onTapFavorites: () {},
                        onTapComparsion: () {},
                        initialComparsions: false,
                        id: -1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
