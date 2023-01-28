import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/dealers/data/datasource/cars_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/datasource/dealer_single_datasource.dart';
import 'package:auto/features/dealers/data/repositories/cars_in_dealers_repository.dart';
import 'package:auto/features/dealers/data/repositories/dealer_single_repository.dart';
import 'package:auto/features/dealers/domain/usecases/cars_in_dealers_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_single_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/cars_in_dealer_bloc/cars_in_dealer_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_single_bloc/dealer_single_bloc.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_single_info_part.dart';
import 'package:auto/features/profile/presentation/pages/directory/directory_sliver_delegete.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

// ignore: must_be_immutable
class UserSinglePage extends StatefulWidget {
  //final String dealerType;
  final String slug;

  const UserSinglePage({
    //required this.dealerType,
    required this.slug,
  });

  @override
  State<UserSinglePage> createState() => _UserSinglePageState();
}

class _UserSinglePageState extends State<UserSinglePage> {
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
  void dispose() {
    dealerSingleBloc.close();
    carsBloc.close();
    super.dispose();
  }

  late YandexMapController controller;
  double maxZoomLevel = 0;
  double minZoomLevel = 0;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: dealerSingleBloc),
          BlocProvider.value(value: carsBloc),
        ],
        child: Scaffold(
          body: BlocBuilder<DealerSingleBloc, DealerSingleState>(
            builder: (context, dealerSingleState) {
              if (dealerSingleState.status.isSubmissionSuccess) {
                final item = dealerSingleState.dealerSingleEntity;
                return NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) =>
                      <Widget>[
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: DirectorySliverDelegate(
                          gallery: item.gallery,
                          avatarImage: item.avatar,
                          name: item.name,
                          minHeight: MediaQuery.of(context).size.height * 0.11,
                          category: LocaleKeys.private_person.tr()),
                    ),
                  ],
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 16, right: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteToNero,
                                border: Border.all(
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .solitude2ToNightRider,
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Информация о продавце',
                                    style: TextStyle(
                                        color: orange,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 16),
                                  Info(
                                      text:
                                          '${LocaleKeys.every_day.tr()}, ${item.contactFrom.substring(0, 5)} - ${item.contactTo.substring(0, 5)}',
                                      icon: AppIcons.clock),
                                  const SizedBox(height: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: warmerGrey,
                                    ),
                                    padding: const EdgeInsets.all(1),
                                    height: 110,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: YandexMap(
                                        rotateGesturesEnabled: false,
                                        onMapCreated: (controller) async {
                                          controller = controller;
                                          await controller.moveCamera(
                                            CameraUpdate.newCameraPosition(
                                              CameraPosition(
                                                target: Point(
                                                    latitude: item.latitude,
                                                    longitude: item.longitude),
                                              ),
                                            ),
                                            animation: const MapAnimation(
                                                duration: 0.15,
                                                type: MapAnimationType.smooth),
                                          );
                                        },
                                        mapObjects: [
                                          PlacemarkMapObject(
                                            icon: PlacemarkIcon.single(
                                              PlacemarkIconStyle(
                                                scale: 0.6,
                                                image: BitmapDescriptor
                                                    .fromAssetImage(
                                                        AppIcons.currentLoc),
                                              ),
                                            ),
                                            mapId: MapObjectId(
                                                item.latitude.toString()),
                                            point: Point(
                                                latitude: item.latitude,
                                                longitude: item.longitude),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Info(
                                      text: item.phoneNumber,
                                      icon: AppIcons.tablerPhone,
                                    ),
                                  ),
                                  Info(
                                      icon: AppIcons.tablerInfo,
                                      text: item.description),
                                ],
                              )),
                          BlocBuilder<CarsInDealerBloc, CarsInDealerState>(
                            builder: (context, allCarsState) =>
                                allCarsState.cars.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16,
                                            bottom: 12,
                                            left: 16,
                                            right: 16),
                                        child: Text(
                                          LocaleKeys.all.tr(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: greyText),
                                        ),
                                      )
                                    : const SizedBox(),
                          ),
                          BlocBuilder<CarsInDealerBloc, CarsInDealerState>(
                            builder: (context, allCarsState) => allCarsState
                                    .cars.isNotEmpty
                                ? ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: allCarsState.cars.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: InfoContainer(
                                        index: index,
                                        avatarPicture: dealerSingleState
                                            .dealerSingleEntity.avatar,
                                        carModel: allCarsState
                                            .cars[index].absoluteCarName,
                                        hasDiscount: false,
                                        location: allCarsState
                                            .cars[index].region.title,
                                        owner: dealerSingleState
                                            .dealerSingleEntity.name,
                                        ownerType: 'a',
                                        publishTime:
                                            MyFunctions.getAutoPublishDate(
                                                allCarsState
                                                    .cars[index].createdAt),
                                        subtitle: allCarsState
                                            .cars[index].description,
                                        year: allCarsState.cars[index].year,
                                        price: allCarsState.cars[index].price,
                                        discountPrice:
                                            allCarsState.cars[index].price,
                                        sellType: 'Продажа Автомобиля',
                                        hasStatusInfo: true,
                                        hasCallCard: true,
                                        gallery:
                                            allCarsState.cars[index].gallery,
                                        currency:
                                            allCarsState.cars[index].currency,
                                        initialLike: false,
                                        onTapFavorites: () {},
                                        onTapComparsion: () {},
                                        initialComparsions: false,
                                        id: -1,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ],
                      ),
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
