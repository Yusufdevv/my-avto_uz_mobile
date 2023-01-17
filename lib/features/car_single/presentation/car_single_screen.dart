import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/other_ads_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/sold_ads_usecase.dart';
import 'package:auto/features/car_single/presentation/bloc/car_single_bloc.dart';
import 'package:auto/features/car_single/presentation/parts/car_seller_card.dart';
import 'package:auto/features/car_single/presentation/parts/descriptions/seller_comment.dart';
import 'package:auto/features/car_single/presentation/parts/owner_actions.dart';
import 'package:auto/features/car_single/presentation/widgets/app_bar.dart';
import 'package:auto/features/car_single/presentation/widgets/bottom_item.dart';
import 'package:auto/features/car_single/presentation/widgets/car_characteristic_image.dart';
import 'package:auto/features/car_single/presentation/widgets/car_name_widget.dart';
import 'package:auto/features/car_single/presentation/widgets/cars_characteristic.dart';
import 'package:auto/features/car_single/presentation/widgets/other_ads_item.dart';
import 'package:auto/features/car_single/presentation/widgets/persistant_header.dart';
import 'package:auto/features/car_single/presentation/widgets/vin_soon_item.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:share_plus/share_plus.dart';

class CarSingleScreen extends StatefulWidget {
  final int id;

  const CarSingleScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<CarSingleScreen> createState() => _CarSingleScreenState();
}

class _CarSingleScreenState extends State<CarSingleScreen>
    with SingleTickerProviderStateMixin {
  Brightness brightness = Brightness.light;
  CrossFadeState actionState = CrossFadeState.showFirst;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  final Color color = white;
  late CarSingleBloc bloc;
  late TabController _tabController;
  late bool isLike;
  late bool isDisable;
  late ScrollController _scrollController;
  late DateTime timeFrom;
  late DateTime timeTo;
  bool isAppBarOffset = false;
  Color tabColor = border;
  Color iconColor = white;
  Color likeColor = white;
  int currentindex = 0;
  int currentIndex = 0;
  double height = 36;

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
    isDisable = true;
    isLike = false;
    bloc = CarSingleBloc(
        GetCarSingleUseCase(
            repository: serviceLocator<CarSingleRepositoryImpl>()),
        OtherAdsUseCase(repository: serviceLocator<CarSingleRepositoryImpl>()),
        SoldAdsUseCase(repository: serviceLocator<CarSingleRepositoryImpl>()))
      ..add(CarSingleEvent.getSingle(widget.id));
    _scrollController.addListener(() {
      if (_scrollController.offset > 285 && isAppBarOffset != true) {
        actionState = CrossFadeState.showSecond;
        isAppBarOffset = true;
        setState(() {});
      } else if (_scrollController.offset < 287 && isAppBarOffset != false) {
        isAppBarOffset = false;
        actionState = CrossFadeState.showFirst;
        setState(() {});
      } else {
        likeColor = white;
        crossFadeState = CrossFadeState.showFirst;
        setState(() {});
      }
      if (_scrollController.offset > 240) {
        iconColor = grey;
      } else {
        iconColor = white;
      }
      if (_scrollController.offset > 240) {
        brightness = Brightness.dark;
      } else {
        brightness = Brightness.light;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: BlocBuilder<CarSingleBloc, CarSingleState>(
            builder: (context, state) {
              if (state.status != FormzStatus.submissionSuccess) {
                return const Center(child: CupertinoActivityIndicator());
              } else {
                return Stack(
                  children: [
                    CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverAppBarItem(
                          id: state.singleEntity.id,
                          brightness: brightness,
                          iconColor: iconColor,
                          absoluteCarName: state.singleEntity.absoluteCarName,
                          actionState: actionState,
                          isWishlisted: state.singleEntity.isWishlisted,
                          dealerName: state.singleEntity.user.name,
                          position: state.singleEntity.userType,
                          avatar: state.singleEntity.user.avatar ??
                              AppIcons.defalut,
                          shareUrl:
                              'https://panel.avto.uz/api/v1/car/announcement/${state.singleEntity.id}/detail/',
                          images: state.singleEntity.gallery,
                          onDealer: () {},
                          onCompare: () {},
                          isMine: state.singleEntity.isMine,
                          status: state.soldStatus,
                          onSold: () {
                            print('bosildi');
                            context
                                .read<CarSingleBloc>()
                                .add(CarSingleEvent.soldAds(widget.id));
                          },
                        ),
                        SliverToBoxAdapter(
                          child: CarNameWidget(
                            fullname: state.singleEntity.absoluteCarName,
                            price: MyFunctions.getFormatCost(
                              state.singleEntity.price,
                            ),
                            date: state.singleEntity.publishedAt,
                            view: '${state.singleEntity.viewsCount}',
                            id: '${state.singleEntity.id}',
                            currency: state.singleEntity.currency == 'usd'
                                ? 'USD'
                                : 'UZS',
                            onVin: () {},
                            onComparison: () {},
                            onShare: () {
                              Share.share(
                                  'https://panel.avto.uz/api/v1/car/announcement/${state.singleEntity.id}/detail/');
                            },
                            year: '${state.singleEntity.year}',
                            mileage: '${state.singleEntity.distanceTraveled}',
                            body: state.singleEntity.bodyType.type,
                            color: state.singleEntity.color,
                            complectation: '',
                            engineVolume:
                                state.singleEntity.modificationType.volume,
                            gearType: state.singleEntity.gearboxType.type,
                            uzb: state.singleEntity.isRegisteredLocally
                                ? 'Да'
                                : 'Нет',
                            priceBsh: state.singleEntity.price,
                            middlePrice: '400 00 00',
                            ration: '30 000 000',
                            dateBsh: '25 mart',
                            percent: '5',
                            isMine: state.singleEntity.isMine,
                            saleDays: 5,
                            addToFavorite: 4,
                            callToNumber: 4,
                            daysLeft: 8,
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: OwnerActions(),
                        ),
                        SliverToBoxAdapter(
                          child: CarSellerCard(
                            image: state.singleEntity.userType == 'dealer'
                                ? state.singleEntity.user.avatar ?? ''
                                : state.singleEntity.user.image ?? '',
                            name: state.singleEntity.userType == 'dealer'
                                ? state.singleEntity.user.name
                                : state.singleEntity.user.fullName,
                            position: state.singleEntity.userType,
                            isCrashed: false,
                          ),
                        ),
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: DescriptionHeader(
                            controller: _tabController,
                            onTap: (integer) {
                              changeIndex(integer);
                              setState(
                                () {
                                  currentindex = integer;
                                },
                              );
                            },
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: (currentindex == 0)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (state.singleEntity.description != null)
                                      SellerComment(
                                        comment: state.singleEntity.description,
                                      )
                                    else
                                      SizedBox(),
                                    const VinSoonItem(),
                                  ],
                                )
                              : CarCharacteristicItem(
                                  bodyType: state.singleEntity.bodyType.type,
                                  milleage:
                                      '${state.singleEntity.distanceTraveled}',
                                  driveType: state.singleEntity.driveType.type,
                                  engineType:
                                      state.singleEntity.engineType.type,
                                  gearboxType:
                                      state.singleEntity.gearboxType.type,
                                  enginePower:
                                      state.singleEntity.modificationType.power,
                                  engineVolume: state
                                      .singleEntity.modificationType.volume,
                                ),
                        ),
                        if (state.singleEntity.damagedParts.isNotEmpty)
                          SliverToBoxAdapter(
                            child: CarCharacteristicImage(
                              informAboutDoors: state.singleEntity.damagedParts,
                            ),
                          ),
                        SliverToBoxAdapter(
                          child: state.elasticSearchEntity.isNotEmpty
                              ? OtherAdsItem(
                                  makeName: state.singleEntity.make.name,
                                  imageUrl: '${state.singleEntity.make.logo}',
                                  status: state.status,
                                  widget: Paginator(
                                    scrollDirection: Axis.horizontal,
                                    paginatorStatus: state.status,
                                    itemBuilder: (context, index) => AdsItem(
                                      id: state.elasticSearchEntity[index].id,
                                      name: state.elasticSearchEntity[index]
                                          .carModel.name,
                                      price:
                                          '${state.elasticSearchEntity[index].price}',
                                      location: state.elasticSearchEntity[index]
                                          .region.title,
                                      description: state
                                          .elasticSearchEntity[index]
                                          .description,
                                      image: state.elasticSearchEntity[index]
                                          .gallery[0],
                                      currency: state
                                          .elasticSearchEntity[index].currency,
                                      isLiked: false,
                                      onTapLike: () {},
                                    ),
                                    itemCount: state.elasticSearchEntity.length,
                                    fetchMoreFunction: () {},
                                    hasMoreToFetch: state.fetchMore,
                                    errorWidget: Container(),
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 70,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: BottomItem(
                        callFrom: state.singleEntity.contactAvailableFrom,
                        callTo: state.singleEntity.contactAvailableTo,
                        phoneNumber: state.singleEntity.user.phoneNumber,
                        userAvatar: state.singleEntity.user.avatar,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      );
}
