import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/other_ads_usecase.dart';
import 'package:auto/features/car_single/presentation/bloc/car_single_bloc.dart';
import 'package:auto/features/car_single/presentation/parts/car_seller_card.dart';
import 'package:auto/features/car_single/presentation/parts/characteristics/car_characteristic.dart';
import 'package:auto/features/car_single/presentation/parts/descriptions/seller_comment.dart';
import 'package:auto/features/car_single/presentation/parts/owner_actions.dart';
import 'package:auto/features/car_single/presentation/widgets/car_name_widget.dart';
import 'package:auto/features/car_single/presentation/widgets/cars_characteristic.dart';
import 'package:auto/features/car_single/presentation/widgets/dealer_time_botomsheet.dart';
import 'package:auto/features/car_single/presentation/widgets/more_actions_bottomsheet.dart';
import 'package:auto/features/car_single/presentation/widgets/persistant_header.dart';
import 'package:auto/features/car_single/presentation/widgets/sliver_images_item.dart';
import 'package:auto/features/car_single/presentation/widgets/vin_soon_item.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_like.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CarSingleScreen extends StatefulWidget {
  const CarSingleScreen({Key? key}) : super(key: key);

  @override
  State<CarSingleScreen> createState() => _CarSingleScreenState();
}

class _CarSingleScreenState extends State<CarSingleScreen>
    with SingleTickerProviderStateMixin {
  final Color color = white;
  late CarSingleBloc bloc;
  late TabController _tabController;
  late bool isLike;
  late bool isDisable;
  late ScrollController _scrollController;
  late DateTime timeFrom;
  late DateTime timeTo;
  Color tabColor = border;
  Color iconColor = white;
  Color likeColor = white;
  CrossFadeState actionState = CrossFadeState.showFirst;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  bool isAppBarOffset = false;
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
        OtherAdsUseCase(repository: serviceLocator<CarSingleRepositoryImpl>()))
      ..add(CarSingleEvent.getSingle(9))
      ..add(CarSingleEvent.getOtherAds(2));
    _scrollController.addListener(() {
      if (_scrollController.offset > 287 && isAppBarOffset != true) {
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
                        SliverAppBar(
                          elevation: 0,
                          pinned: true,
                          stretch: true,
                          floating: false,
                          expandedHeight: 311,
                          automaticallyImplyLeading: false,
                          title: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                  AppIcons.chevronLeft,
                                  width: 24,
                                  height: 24,
                                  color: iconColor,
                                ),
                              ),
                              Expanded(
                                child: AnimatedCrossFade(
                                  firstChild: const SizedBox(),
                                  secondChild: Text(
                                    state.singleEntity.absoluteCarName,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  crossFadeState: actionState,
                                  duration: const Duration(
                                    milliseconds: 100,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: WLike(
                                  color: iconColor,
                                ),
                              ),
                              GestureDetector(
                                child: SvgPicture.asset(AppIcons.moreVertical,
                                    width: 36, height: 36, color: iconColor),
                                onTap: () {
                                  showModalBottomSheet(
                                    useRootNavigator: true,
                                    backgroundColor: Colors.transparent,
                                    isScrollControlled: false,
                                    context: context,
                                    builder: (context) => MoreActions(
                                      name: state.singleEntity.user.name,
                                      position: state.singleEntity.userType,
                                      image:
                                          state.singleEntity.user.avatar ?? '',
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          flexibleSpace: FlexibleSpaceBar(
                            background: SingleImagePart(
                              count: 0,
                              images: state.singleEntity.gallery,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: CarNameWidget(
                            fullname: state.singleEntity.absoluteCarName,
                            price: state.singleEntity.price,
                            date: state.singleEntity.publishedAt,
                            view: '${state.singleEntity.viewsCount}',
                            id: '${state.singleEntity.id}',
                            currency: state.singleEntity.currency,
                            onVin: () {},
                            onComparison: () {},
                            onShare: () {
                              Share.share('Auto uz');
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
                                    SellerComment(
                                      comment: state.singleEntity.description,
                                    ),
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
                        const SliverToBoxAdapter(
                          child: CarCharacteristic(),
                        ),
                        SliverToBoxAdapter(
                          child: state.elasticSearchEntity.isNotEmpty
                              ? Container(
                                  height: 400,
                                  padding: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .extension<ThemedColors>()!
                                          .whiteToDark,
                                      border: Border.all(color: border)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Text(
                                          LocaleKeys.Other_announcements.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            16, 8, 16, 0),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .extension<ThemedColors>()!
                                              .solitudeTo1Black,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: const EdgeInsets.all(2),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16, right: 28),
                                              child: Text(
                                                state.singleEntity.make.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700),
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.5),
                                                  color: Theme.of(context)
                                                      .extension<
                                                          ThemedColors>()!
                                                      .whiteToEclipse,
                                                  border: Border.all(
                                                      color: border)),
                                              height: 36,
                                              child: Center(
                                                child: CachedNetworkImage(
                                                  imageUrl: state
                                                      .singleEntity.model.name,
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          const SizedBox(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      BlocBuilder<CarSingleBloc,
                                          CarSingleState>(
                                        builder: (context, state) {
                                          if (state.status !=
                                              FormzStatus.submissionSuccess) {
                                            return const CupertinoActivityIndicator();
                                          } else {
                                            return Expanded(
                                              child: Paginator(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                paginatorStatus: state.status,
                                                itemBuilder: (context, index) =>
                                                    AdsItem(
                                                  name: state
                                                      .elasticSearchEntity[
                                                          index]
                                                      .carModel
                                                      .name,
                                                  price:
                                                      '${state.elasticSearchEntity[index].price}',
                                                  location: state
                                                      .elasticSearchEntity[
                                                          index]
                                                      .region
                                                      .title,
                                                  description: state
                                                      .elasticSearchEntity[
                                                          index]
                                                      .description,
                                                  image: state
                                                      .elasticSearchEntity[
                                                          index]
                                                      .gallery[0],
                                                  currency: state
                                                      .elasticSearchEntity[
                                                          index]
                                                      .currency,
                                                  isLiked: false,
                                                  onTapLike: () {},
                                                ),
                                                itemCount: state
                                                    .elasticSearchEntity.length,
                                                fetchMoreFunction: () {},
                                                hasMoreToFetch: state.fetchMore,
                                                errorWidget: Container(),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
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
                      child: Row(
                        children: [
                          Expanded(
                            child: MyFunctions.enableForCalling(
                                    callFrom:
                                        state.singleEntity.contactAvailableFrom,
                                    callTo:
                                        state.singleEntity.contactAvailableTo)
                                ? WButton(
                                    onTap: () {
                                      launchUrl(Uri.parse('tel://${state.singleEntity.user.phoneNumber}'));
                                    },
                                    height: 44,
                                    borderRadius: 8,
                                    color: const Color(0xff5ECC81),
                                    text: LocaleKeys.call.tr(),
                                    textColor: Colors.white,
                                  )
                                : WButton(
                                    onTap: () {
                                      showModalBottomSheet(
                                        useRootNavigator: true,
                                        isScrollControlled: false,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) => DealerTime(
                                          timeTo: state
                                              .singleEntity.contactAvailableTo,
                                          timeFrom: state.singleEntity
                                              .contactAvailableFrom,
                                        ),
                                      );
                                    },
                                    height: 44,
                                    borderRadius: 8,
                                    color: const Color(0xffB5B5BE),
                                    text: LocaleKeys.call.tr(),
                                    textColor: Colors.white,
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        SvgPicture.asset(
                                          AppIcons.info,
                                          color: white,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'Позвонить',
                                          style: TextStyle(color: border),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          WScaleAnimation(
                            onTap: () {},
                            child: Container(
                              height: 44,
                              decoration: BoxDecoration(
                                  color: grey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: 44,
                                  imageUrl:
                                      state.singleEntity.user.avatar ?? '',
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    AppImages.defaultPhoto,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
