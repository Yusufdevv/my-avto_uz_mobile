// ignore_for_file: unnecessary_null_comparison

import 'package:auto/assets/colors/color.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/usecases/call_count_usecase.dart';
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
import 'package:auto/features/car_single/presentation/widgets/confirm_bottomsheet.dart';
import 'package:auto/features/car_single/presentation/widgets/other_ads_item.dart';
import 'package:auto/features/car_single/presentation/widgets/persistant_header.dart';
import 'package:auto/features/car_single/presentation/widgets/vin_soon_item.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:share_plus/share_plus.dart';

class CarSingleScreen extends StatefulWidget {
  final int id;

  const CarSingleScreen({
    required this.id,
    Key? key,
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
        SoldAdsUseCase(repository: serviceLocator<CarSingleRepositoryImpl>()),
        CallCount(repository: serviceLocator<CarSingleRepositoryImpl>()))
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        context.read<CarSingleBloc>().add(CarSingleEvent.callCount(widget.id));
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: CustomScreen(
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
                        physics: const BouncingScrollPhysics(),
                        controller: _scrollController,
                        slivers: [
                          SliverAppBarItem(
                            id: state.singleEntity.id,
                            brightness: brightness,
                            iconColor: iconColor,
                            absoluteCarName: state.singleEntity.absoluteCarName,
                            actionState: actionState,
                            isWishlisted: state.singleEntity.isWishlisted,
                            dealerName: state.singleEntity.userType == 'owner'
                                ? state.singleEntity.user.fullName
                                : state.singleEntity.user.name,
                            position: state.singleEntity.userType,
                            avatar: state.singleEntity.userType == 'owner'
                                ? state.singleEntity.user.fullName
                                : state.singleEntity.user.avatar,
                            shareUrl:
                                'https://panel.avto.uz/api/v1/car/announcement/${state.singleEntity.id}/detail/',
                            images: state.singleEntity.gallery,
                            onDealer: () {},
                            onCompare: () {},
                            isMine: state.singleEntity.isMine,
                            status: state.soldStatus,
                            onSold: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) =>   ConfirmBottomSheet(
                                  title:
                                      LocaleKeys.a_y_s_y_w_t_c_t_a.tr(),
                                  subTitle: '',
                                  betweenHeight: 0,
                                ),
                              ).then((value) {
                                if (value == true) {
                                  Navigator.pop(context);
                                  bloc.add(
                                    CarSingleEvent.soldAds(
                                      widget.id,
                                      (message) {
                                        context.read<ShowPopUpBloc>().add(
                                            ShowPopUp(
                                                message: state.succMessage,
                                                isSucces: true));
                                      },
                                      (errorMessage) {
                                        context.read<ShowPopUpBloc>().add(
                                            ShowPopUp(
                                                message: state.errorMessage,
                                                isSucces: false));
                                      },
                                    ),
                                  );
                                }
                              });
                            },
                            isCompare: state.singleEntity.isComparison,
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
                                  ? LocaleKeys.yes.tr()
                                  : LocaleKeys.no.tr(),
                              priceBsh: state.singleEntity.price,
                              middlePrice: state
                                  .singleEntity.priceAnalytics.averagePrice,
                              ration: state
                                  .singleEntity.priceAnalytics.priceDifference,
                              dateBsh: '25 mart',
                              percent: MyFunctions.getFormatCost(
                                  '${100 - state.singleEntity.priceAnalytics.percentage}'),
                              isMine: state.singleEntity.isMine,
                              saleDays:
                                  '${DateTime.now().difference(DateTime.parse(state.singleEntity.publishedAt)).inDays + 1}',
                              addToFavorite: state.singleEntity.wishlistCount,
                              callToNumber: state.singleEntity.callCount,
                              daysLeft: state.singleEntity.expiredAt != '' &&
                                      state.singleEntity.publishedAt != ''
                                  ? '${DateTime.parse(state.singleEntity.expiredAt).difference(DateTime.parse(state.singleEntity.publishedAt)).inDays + 1}'
                                  : LocaleKeys.what_was_ordered.tr(),
                              compareId: state.singleEntity.id,
                              isCompared: state.singleEntity.isComparison,
                              percenti:
                                  state.singleEntity.priceAnalytics.percentage,
                              procent:
                                  state.singleEntity.priceAnalytics.percentage,
                            ),
                          ),
                          if (state.singleEntity.isMine)
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (state
                                          .singleEntity.description.isNotEmpty)
                                        SellerComment(
                                          comment:
                                              state.singleEntity.description,
                                        )
                                      else
                                        const SizedBox(),
                                      const VinSoonItem(),
                                    ],
                                  )
                                : CarCharacteristicItem(
                                    bodyType: state.singleEntity.bodyType.type,
                                    milleage:
                                        '${state.singleEntity.distanceTraveled}',
                                    driveType:
                                        state.singleEntity.driveType.type,
                                    engineType:
                                        state.singleEntity.engineType.type,
                                    gearboxType:
                                        state.singleEntity.gearboxType.type,
                                    enginePower: state
                                        .singleEntity.modificationType.power,
                                    engineVolume: state
                                        .singleEntity.modificationType.volume,
                                  ),
                          ),
                          if (state.singleEntity.damagedParts.isNotEmpty)
                            SliverToBoxAdapter(
                              child: CarCharacteristicImage(
                                informAboutDoors:
                                    state.singleEntity.damagedParts,
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
                                        location: state
                                            .elasticSearchEntity[index]
                                            .region
                                            .title,
                                        description: state
                                            .elasticSearchEntity[index]
                                            .description,
                                        image: state.elasticSearchEntity[index]
                                            .gallery[0],
                                        currency: state
                                            .elasticSearchEntity[index]
                                            .currency,
                                        isLiked: false,
                                        onTapLike: () {},
                                      ),
                                      itemCount:
                                          state.elasticSearchEntity.length,
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
                          id: state.singleEntity.id,
                          usertype: state.singleEntity.userType,
                          slug: state.singleEntity.user.slug,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      );
}
