import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:auto/features/car_single/presentation/bloc/car_single_bloc.dart';
import 'package:auto/features/car_single/presentation/parts/car_seller_card.dart';
import 'package:auto/features/car_single/presentation/parts/characteristics/car_characteristic.dart';
import 'package:auto/features/car_single/presentation/parts/description_tabs.dart';
import 'package:auto/features/car_single/presentation/parts/other_ads.dart';
import 'package:auto/features/car_single/presentation/parts/owner_actions.dart';
import 'package:auto/features/car_single/presentation/widgets/car_name_widget.dart';
import 'package:auto/features/car_single/presentation/widgets/dealer_time_botomsheet.dart';
import 'package:auto/features/car_single/presentation/widgets/more_actions_bottomsheet.dart';
import 'package:auto/features/car_single/presentation/widgets/sliver_images_item.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_like.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

class CarSingleScreen extends StatefulWidget {
  const CarSingleScreen({Key? key}) : super(key: key);

  @override
  State<CarSingleScreen> createState() => _CarSingleScreenState();
}

class _CarSingleScreenState extends State<CarSingleScreen> {
  late CarSingleBloc bloc;
  final Color color = white;
  late bool isLike;
  late bool isDisable;
  final ScrollController _scrollController = ScrollController();
  Color likeColor = white;
  String title = 'dasdasca';
  double height = 36;
  CrossFadeState actionState = CrossFadeState.showFirst;
  bool isAppBarOffset = false;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  int currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  late DateTime timeFrom;
  late DateTime timeTo;

  @override
  void initState() {
    isDisable = true;
    isLike = false;
    bloc = CarSingleBloc(GetCarSingleUseCase(
        repository: serviceLocator<CarSingleRepositoryImpl>()))
      ..add(CarSingleEvent.getSingle(1));

    _scrollController.addListener(() {
      if (_scrollController.offset > 287 && isAppBarOffset != true) {
        actionState = CrossFadeState.showSecond;
        isAppBarOffset = true;
        setState(() {});
      } else if (_scrollController.offset < 287 && isAppBarOffset != false) {
        isAppBarOffset = false;
        actionState = CrossFadeState.showFirst;
        title = 'Mersedes Benz';
        setState(() {});
      } else {
        likeColor = white;
        crossFadeState = CrossFadeState.showFirst;
        title = '';
        setState(() {});
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
                print('STATUS IS ${state.status}');
                print('DATA FROM BLOC ${state.singleEntity.make}');
                return const Center(child: CupertinoActivityIndicator());
              } else {
                timeFrom =
                    Jiffy(state.singleEntity.contactAvailableFrom, 'hh:MM:ss')
                        .dateTime;
                timeTo =
                    Jiffy(state.singleEntity.contactAvailableTo, 'hh:MM:ss')
                        .dateTime;
                print(state.singleEntity.contactAvailableTo);
                print(state.singleEntity.contactAvailableFrom);
                print(
                    "Jiffy(state.singleEntity.contactAvailableFrom,'hh:MM:ss').isAfter(DateTime.now()) : ${Jiffy(state.singleEntity.contactAvailableFrom, 'hh:MM:ss').isSameOrAfter(DateTime.now())}");
                print(
                    "Jiffy(state.singleEntity.contactAvailableTo,'hh:MM:ss').isBefore(DateTime.now()) : ${Jiffy(state.singleEntity.contactAvailableTo, 'hh:MM:ss').isBefore(DateTime.now())}");
                print('STATUS IS ${state.status}');
                return Stack(
                  children: [
                    CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverAppBar(
                          stretch: true,
                          pinned: true,
                          floating: false,
                          elevation: 0,
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
                                ),
                              ),
                              Expanded(
                                child: AnimatedCrossFade(
                                  firstChild: const SizedBox(),
                                  secondChild: Text(
                                    state.singleEntity.absoluteCarName,
                                    style: const TextStyle(color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  crossFadeState: actionState,
                                  duration: const Duration(milliseconds: 100),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              // if (currentIndex != 0)
                              //   GestureDetector(
                              //     onTap: () {},
                              //     child: SvgPicture.asset(
                              //       AppIcons.edit,
                              //       height: 25,
                              //       width: 25,
                              //     ),
                              //   )
                              // else
                              const WLike(),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                child: SvgPicture.asset(
                                  AppIcons.moreVertical,
                                  width: 36,
                                  height: 36,
                                  color: grey,
                                ),
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
                          )),
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
                            onShare: () {},
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
                        // if (currentIndex != 0)
                        //   SliverToBoxAdapter(
                        //     child: Column(
                        //       children: [
                        //         DayLikeCallItem(
                        //           days: '${state.singleEntity.viewsCount}',
                        //           likes: '${state.singleEntity.viewsCount}',
                        //           calls: '${state.singleEntity.viewsCount}',
                        //         ),
                        //         AnnouncementPeriodItem(
                        //           days: '${state.singleEntity.viewsCount}' +
                        //               ' дня',
                        //         )
                        //       ],
                        //     ),
                        //   )
                        // else
                        //   const SliverToBoxAdapter(child: SizedBox()),
                        SliverToBoxAdapter(
                          child: Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: const OwnerActions(),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .solitudeToDarkRider,
                              ),
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteToDark,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CarSellerCard(
                              image: state.singleEntity.user.avatar ?? '',
                              name: state.singleEntity.user.name,
                              position: state.singleEntity.userType,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: DescriptionTabs(
                            changeIndex: changeIndex,
                            comment: state.singleEntity.description,
                            complectation: state.singleEntity.model.name,
                            complectationItem: state.singleEntity.model.name,
                            bodyType: state.singleEntity.bodyType.type,
                            milleage: '${state.singleEntity.distanceTraveled}',
                            driveType: state.singleEntity.driveType.type,
                            engineType: state.singleEntity.engineType.type,
                            gearboxType: state.singleEntity.gearboxType.type,
                            enginePower:
                                state.singleEntity.modificationType.power,
                            engineVolume:
                                state.singleEntity.modificationType.volume,
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: CarCharacteristic(),
                        ),
                        const SliverToBoxAdapter(
                          child: OtherAds(),
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
                            child: Jiffy(
                                            state.singleEntity
                                                .contactAvailableFrom,
                                            'hh:MM:ss')
                                        .isAfter(DateTime.now()) &&
                                    Jiffy(state.singleEntity.contactAvailableTo,
                                            'hh:MM:ss')
                                        .isAfter(DateTime.now())
                                ? WButton(
                                    onTap: () {
                                      print(
                                          'DateTime.now().isAfter(timeFrom) : ${DateTime.now().isAfter(timeFrom)}');
                                      print(
                                          'DateTime.now().isBefore(timeTo) : ${DateTime.now().isBefore(timeTo)}');
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
                                      // Navigator.of(context).push(fade(page: const DealerScreen()));
                                    },
                                    height: 44,
                                    borderRadius: 8,
                                    color: const Color(0xff5ECC81),
                                    text: LocaleKeys.call.tr(),
                                    textColor: Colors.white,
                                  )
                                : WButton(
                                    onTap: () {
                                      print(
                                          'DateTime.now().isAfter(timeFrom) : ${DateTime.now().isAfter(timeFrom)}');
                                      print(
                                          'DateTime.now().isBefore(timeTo) : ${DateTime.now().isBefore(timeTo)}');
                                      DateTime.now().isAfter(timeFrom) &&
                                              DateTime.now().isBefore(timeTo)
                                          ? launch(
                                              'tel://${state.singleEntity.user.phoneNumber}')
                                          : showModalBottomSheet(
                                              useRootNavigator: true,
                                              isScrollControlled: false,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) => DealerTime(
                                                timeTo: state.singleEntity
                                                        .contactAvailableFrom,
                                                timeFrom: state.singleEntity
                                                        .contactAvailableTo,
                                              ),
                                            );
                                      // Navigator.of(context).push(fade(page: const DealerScreen()));
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
                                  width: 44,
                                  height: 44,
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
