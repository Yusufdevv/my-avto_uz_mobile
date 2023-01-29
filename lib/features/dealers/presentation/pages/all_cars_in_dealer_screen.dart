import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/dealers/data/datasource/cars_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/datasource/dealer_single_datasource.dart';
import 'package:auto/features/dealers/data/repositories/cars_in_dealers_repository.dart';
import 'package:auto/features/dealers/data/repositories/dealer_single_repository.dart';
import 'package:auto/features/dealers/domain/usecases/cars_in_dealers_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_single_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/cars_in_dealer_bloc/cars_in_dealer_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_single_bloc/dealer_single_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCarsInDealerScreen extends StatefulWidget {
  final String slug;

  const AllCarsInDealerScreen({
    required this.slug,
    Key? key,
  }) : super(key: key);

  @override
  State<AllCarsInDealerScreen> createState() => _AllCarsInDealerScreenState();
}

class _AllCarsInDealerScreenState extends State<AllCarsInDealerScreen> {
  late DealerSingleBloc dealerSingleBloc;
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
    carsBloc = CarsInDealerBloc(
        carsInDealerUseCase: CarsInDealerUseCase(
            cars: CarsInDealerRepositoryImpl(
                dataSource: CarsInDealerDataSource(DioSettings().dio))))
      ..add(CarsInDealerEvent.getResults(slug: widget.slug));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: dealerSingleBloc),
          BlocProvider.value(value: carsBloc),
        ],
        child: BlocBuilder<DealerSingleBloc, DealerSingleState>(
          builder: (context, dealerSingleState) => Scaffold(
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
              builder: (context, carsInDealerState) => ListView(
                children: [
                  ...List.generate(
                    carsInDealerState.cars.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InfoContainer(
                        index: index,
                        avatarPicture: dealerSingleState.dealerSingleEntity.avatar,
                        carModel: carsInDealerState.cars[index].absoluteCarName,
                        hasDiscount: false,
                        location: carsInDealerState.cars[index].region.title,
                        owner: dealerSingleState.dealerSingleEntity.name,
                        ownerType: 'a',
                        publishTime: MyFunctions.getAutoPublishDate(carsInDealerState.cars[index].createdAt),
                        subtitle: carsInDealerState.cars[index].description,
                        year: carsInDealerState.cars[index].year,
                        price: carsInDealerState.cars[index].price,
                        discountPrice: carsInDealerState.cars[index].price,
                        sellType: LocaleKeys.car_sale.tr(),
                        hasStatusInfo: true,
                        hasCallCard: true,
                        gallery: carsInDealerState.cars[index].gallery,
                        currency: carsInDealerState.cars[index].currency,
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
