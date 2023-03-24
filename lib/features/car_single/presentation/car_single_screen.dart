// ignore_for_file: unnecessary_null_comparison
import 'package:auto/assets/colors/color.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_entity.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/preview/widgets/complectation_box.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/usecases/call_count_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/other_ads_usecase.dart';
import 'package:auto/features/car_single/domain/usecases/sold_ads_usecase.dart';
import 'package:auto/features/car_single/presentation/bloc/car_single_bloc.dart';
import 'package:auto/features/car_single/presentation/pages/user_single_page.dart';
import 'package:auto/features/car_single/presentation/parts/car_seller_card.dart';
import 'package:auto/features/car_single/presentation/parts/descriptions/seller_comment.dart';
import 'package:auto/features/car_single/presentation/parts/owner_actions.dart';
import 'package:auto/features/car_single/presentation/widgets/become_verifired_owner_widget.dart';
import 'package:auto/features/car_single/presentation/widgets/bottom_item.dart';
import 'package:auto/features/car_single/presentation/widgets/car_characteristic_image.dart';
import 'package:auto/features/car_single/presentation/widgets/car_name_widget.dart';
import 'package:auto/features/car_single/presentation/widgets/car_single_resend_btn.dart';
import 'package:auto/features/car_single/presentation/widgets/cars_characteristic.dart';
import 'package:auto/features/car_single/presentation/widgets/confirm_bottomsheet.dart';
import 'package:auto/features/car_single/presentation/widgets/other_ads_item.dart';
import 'package:auto/features/car_single/presentation/widgets/persistant_header.dart';
import 'package:auto/features/car_single/presentation/widgets/place_inspection.dart';
import 'package:auto/features/car_single/presentation/widgets/sliver_app_bar_item.dart';
import 'package:auto/features/car_single/presentation/widgets/vin_soon_item.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/dealers/presentation/pages/dealer_single_page.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:share_plus/share_plus.dart';

class CarSingleScreen extends StatefulWidget {
  final int id;
  final String moderationStatus;

  const CarSingleScreen({
    required this.id,
    this.moderationStatus = 'active',
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
        GetCarSingleUseCase(),
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: bloc,
        child: CustomScreen(
          child: Scaffold(
            // backgroundColor:Colors.teal,
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
                            lat: state.singleEntity.latitude,
                            long: state.singleEntity.longitude,
                            isExpired: state.singleEntity.isExpired,
                            expiredDate: state.singleEntity.expiredAt,
                            moderationStatus: widget.moderationStatus,
                            id: state.singleEntity.id,
                            userId: state.singleEntity.user.id,
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
                                ? state.singleEntity.user.image
                                : state.singleEntity.user.avatar,
                            shareUrl:
                                'https://panel.avto.uz/api/v1/car/announcement/${state.singleEntity.id}/detail/',
                            images: state.singleEntity.gallery,
                            onDealer: () {
                              if (state.singleEntity.userType == 'owner') {
                                Navigator.of(context).push(fade(
                                    page: UserSinglePage(
                                  userId: state.singleEntity.user.id,
                                  announcementId: state.singleEntity.id,
                                )));
                              }
                              if (state.singleEntity.userType == 'dealer' &&
                                  state.singleEntity.user.slug.isNotEmpty) {
                                Navigator.of(context).push(fade(
                                    page: DealerSinglePage(
                                        slug: state.singleEntity.user.slug)));
                              }
                            },
                            onCompare: () {
                              /// tegma, ichkarida AddComparisonItemda function-i yozilgan
                            },
                            isMine: state.singleEntity.isMine,
                            status: state.soldStatus,
                            onSold: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) => ConfirmBottomSheet(
                                  title: LocaleKeys.a_y_s_y_w_t_c_t_a.tr(),
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
                                                status: PopStatus.success,
                                              ),
                                            );
                                      },
                                      (errorMessage) {
                                        context.read<ShowPopUpBloc>().add(
                                              ShowPopUp(
                                                message: state.errorMessage,
                                                status: PopStatus.error,
                                              ),
                                            );
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
                              gasBalloonInfo:
                                  state.singleEntity.gasEquipment.name.isEmpty
                                      ? LocaleKeys.no.tr()
                                      : state.singleEntity.gasEquipment.name,
                              moderationStatus: widget.moderationStatus,
                              fullname: state.singleEntity.absoluteCarName,
                              price: MyFunctions.getFormatCost(
                                state.singleEntity.price,
                              ),
                              date: state.singleEntity.publishedAt,
                              view: '${state.singleEntity.viewsCount}',
                              todayViewedCount:
                                  '${state.singleEntity.todayViewedCount}',
                              id: '${state.singleEntity.id}',
                              currency:
                                  state.singleEntity.currency.toUpperCase(),
                              onVin: () {},
                              onComparison: () {
                                /// tegma, ichkarida AddComparisonItemda function-i yozilgan
                              },
                              onShare: () {
                                Share.share(
                                    'https://panel.avto.uz/api/v1/car/announcement/${state.singleEntity.id}/detail/');
                              },
                              year: '${state.singleEntity.year}',
                              mileage: MyFunctions.getThousandsSeparatedPrice(
                                  state.singleEntity.distanceTraveled
                                      .toString()),
                              body: state.singleEntity.bodyType.type,
                              color: state.singleEntity.color.name,
                              complectation: '',
                              engineVolume:
                                  '${state.singleEntity.modificationType.volume} (${state.singleEntity.modificationType.power})',
                              gearType: state.singleEntity.gearboxType.type,
                              uzb: state.singleEntity.isRegisteredLocally
                                  ? LocaleKeys.yes.tr()
                                  : LocaleKeys.no.tr(),
                              priceBsh: state.singleEntity.price,
                              middlePrice: state
                                  .singleEntity.priceAnalytics.averagePrice,
                              ration: state
                                  .singleEntity.priceAnalytics.priceDifference,
                              dateBsh: DateFormat(
                                'd MMMM',
                                StorageRepository.getString('language'),
                              ).format(DateTime.now()),
                              percent: MyFunctions.getFormatCost(
                                  '${100 - state.singleEntity.priceAnalytics.percentage}'),
                              isMine: state.singleEntity.isMine,
                              saleDays:
                                  '${DateTime.now().difference(DateTime.parse(state.singleEntity.publishedAt)).inDays + 1}',
                              addToFavorite: state.singleEntity.wishlistCount,
                              callToNumber: state.singleEntity.callCount,
                              daysLeft: state.singleEntity.expiredAt != '' &&
                                      state.singleEntity.publishedAt != ''
                                  ? '${DateTime.parse(state.singleEntity.expiredAt).difference(DateTime.now()).inDays + 1}'
                                  : LocaleKeys.what_was_ordered.tr(),
                              compareId: state.singleEntity.id,
                              isCompared: state.singleEntity.isComparison,
                              percenti:
                                  state.singleEntity.priceAnalytics.percentage,
                              procent:
                                  state.singleEntity.priceAnalytics.percentage,
                            ),
                          ),
                          ///
                          if (state.singleEntity.isMine &&
                              (widget.moderationStatus ==
                                      ModerationStatusEnum.active.value ||
                                  widget.moderationStatus ==
                                      ModerationStatusEnum
                                          .in_moderation.value)) ...{
                            SliverToBoxAdapter(
                              child: BecomeVerifiredOwnerWidget(
                                comment: state
                                    .singleEntity
                                    .announcementVerifyOwners.comment,
                                  moderationStatus: state
                                      .singleEntity
                                      .announcementVerifyOwners
                                      .moderationStatus,
                                  announcementId: state.singleEntity.id),
                            ),
                          },
                          ///
                          if (state.singleEntity.isMine &&
                              (widget.moderationStatus ==
                                      ModerationStatusEnum.active.value ||
                                  widget.moderationStatus ==
                                      ModerationStatusEnum.in_moderation.value))
                            const SliverToBoxAdapter(
                              child: OwnerActions(),
                            ),

                          ///
                          SliverToBoxAdapter(
                            child: CarSellerCard(
                              moderationStatus: widget.moderationStatus,
                              image: state.singleEntity.userType == 'dealer'
                                  ? state.singleEntity.user.avatar ?? ''
                                  : state.singleEntity.user.image ?? '',
                              name: state.singleEntity.userType == 'dealer'
                                  ? state.singleEntity.user.name
                                  : state.singleEntity.user.fullName != ''
                                      ? state.singleEntity.user.fullName
                                      : state.singleEntity.contactName,
                              userType: state.singleEntity.userType,
                              userId: state.singleEntity.user.id,
                              announcementId: state.singleEntity.id,
                              slug: state.singleEntity.user.slug,
                              isCrashed: false,
                            ),
                          ),
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: DescriptionHeader(
                              controller: _tabController,
                              onTap: (integer) {
                                changeIndex(integer);
                              },
                            ),
                          ),
                          ///
                          SliverToBoxAdapter(
                            child: (currentIndex == 0)
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (!state.singleEntity.isMine &&
                                          state.singleEntity.longitude != 0 &&
                                          state.singleEntity.longitude != 0)
                                        PlaceInspection(
                                          id: state.singleEntity.id,
                                          name: state.singleEntity.contactName,
                                          lat: state.singleEntity.latitude,
                                          long: state.singleEntity.longitude,
                                        ),
                                      if (state
                                          .singleEntity.description.isNotEmpty)
                                        SellerComment(
                                          comment:
                                              state.singleEntity.description,
                                        ),
                                      ComplectationBox(
                                        equipment: state.singleEntity.equipment,
                                        radios: PASingleton.makeRadiosSelected(
                                            v: state.singleEntity.options),
                                        selects:
                                            PASingleton.makeSelectsSelected(
                                                v: state.singleEntity.options),
                                      ),
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
                          ///
                          if (state.singleEntity.damagedParts.isNotEmpty)
                            SliverToBoxAdapter(
                              child: CarCharacteristicImage(
                                  informAboutDoors:
                                      state.singleEntity.damagedParts),
                            ),
                          ///
                          SliverToBoxAdapter(
                            child: state.elasticSearchEntity.length > 1
                                ? OtherAdsItem(
                                    makeName: state.singleEntity.make.name,
                                    imageUrl: '${state.singleEntity.make.logo}',
                                    status: state.status,
                                    widget: Paginator(
                                      scrollDirection: Axis.horizontal,
                                      paginatorStatus: state.adsStatus,
                                      padding: const EdgeInsets.only(
                                          top: 8, left: 16),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                              width: state.singleEntity.id ==
                                                      state
                                                          .elasticSearchEntity[
                                                              index]
                                                          .id
                                                  ? 0
                                                  : 24),
                                      itemBuilder: (context, index) =>
                                          BlocConsumer<WishlistAddBloc,
                                              WishlistAddState>(
                                        listener: (context, stateWish) {
                                          if (stateWish.addStatus
                                                  .isSubmissionSuccess ||
                                              stateWish.removeStatus
                                                  .isSubmissionSuccess) {
                                            if (stateWish.id ==
                                                state.elasticSearchEntity[index]
                                                    .id) {
                                              // context.read<TopAdBloc>().add(
                                              //     TopAdEvent.changeIsWish(
                                              //         index: stateWish.index,
                                              //         id: stateWish.id));
                                            }
                                            context.read<WishlistAddBloc>().add(
                                                WishlistAddEvent.clearState());
                                          }
                                        },
                                        builder: (context, stateWish) {
                                          if (state.singleEntity.id ==
                                              state.elasticSearchEntity[index]
                                                  .id) {
                                            return const SizedBox();
                                          }
                                          return Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 20,
                                            ),
                                            child: AdsItem(
                                              id: state
                                                  .elasticSearchEntity[index]
                                                  .id,
                                              name:
                                                  '${state.elasticSearchEntity[index].make.name} ${state.elasticSearchEntity[index].model.name} ${state.elasticSearchEntity[index].generation.name}',
                                              price:
                                                  '${state.elasticSearchEntity[index].price}',
                                              location: state
                                                  .elasticSearchEntity[index]
                                                  .region
                                                  .title,
                                              description: state
                                                  .elasticSearchEntity[index]
                                                  .description
                                                  .trim(),
                                              image: state
                                                  .elasticSearchEntity[index]
                                                  .gallery[0],
                                              currency: state
                                                  .elasticSearchEntity[index]
                                                  .currency,
                                              isLiked: state
                                                  .elasticSearchEntity[index]
                                                  .isWishlisted,
                                              onTapLike: () {
                                                context.read<WishlistAddBloc>().add(state
                                                        .elasticSearchEntity[
                                                            index]
                                                        .isWishlisted
                                                    ? WishlistAddEvent
                                                        .removeWishlist(
                                                            state
                                                                .elasticSearchEntity[
                                                                    index]
                                                                .id,
                                                            index)
                                                    : WishlistAddEvent.addWishlist(
                                                        state
                                                            .elasticSearchEntity[
                                                                index]
                                                            .id,
                                                        index));
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                      itemCount:
                                          state.elasticSearchEntity.length,
                                      fetchMoreFunction: () {
                                        bloc.add(CarSingleEvent.getMoreOtherAds(
                                            '${state.singleEntity.make.name} ${state.singleEntity.model.name}'));
                                      },
                                      hasMoreToFetch: state.fetchMore,
                                      errorWidget: const SizedBox(),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                          if (widget.moderationStatus ==
                                  ModerationStatusEnum.active.value ||
                              widget.moderationStatus ==
                                  ModerationStatusEnum.blocked.value)
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 74),
                            ),
                        ],
                      ),
                      if (widget.moderationStatus ==
                              ModerationStatusEnum.active.value ||
                          widget.moderationStatus ==
                              ModerationStatusEnum.blocked.value) ...{
                        Positioned(
                          left: 16,
                          right: 16,
                          bottom: 16,
                          child: widget.moderationStatus ==
                                  ModerationStatusEnum.active.value
                              ? BottomItem(
                                  isMine: state.singleEntity.isMine,
                                  callFrom:
                                      state.singleEntity.contactAvailableFrom,
                                  callTo: state.singleEntity.contactAvailableTo,
                                  phoneNumber:
                                      state.singleEntity.user.phoneNumber,
                                  userAvatar:
                                      state.singleEntity.userType == 'dealer'
                                          ? state.singleEntity.user.avatar ?? ''
                                          : state.singleEntity.user.image ?? '',
                                  id: state.singleEntity.id,
                                  userId: state.singleEntity.user.id,
                                  usertype: state.singleEntity.userType,
                                  slug: state.singleEntity.user.slug,
                                )
                              : const CarSingleResendBtn(),
                        )
                      },
                    ],
                  );
                }
              },
            ),
          ),
        ),
      );
}
