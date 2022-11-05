import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/data/datasource/car_single_datasource.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:auto/features/car_single/presentation/bloc/car_single_bloc.dart';
import 'package:auto/features/car_single/presentation/parts/car_actions.dart';
import 'package:auto/features/car_single/presentation/parts/car_details.dart';
import 'package:auto/features/car_single/presentation/parts/car_seller_card.dart';
import 'package:auto/features/car_single/presentation/parts/characteristics/car_characteristic.dart';
import 'package:auto/features/car_single/presentation/parts/description_tabs.dart';
import 'package:auto/features/car_single/presentation/parts/other_ads.dart';
import 'package:auto/features/car_single/presentation/parts/owner_actions.dart';
import 'package:auto/features/car_single/presentation/parts/statistics.dart';
import 'package:auto/features/car_single/presentation/widgets/dealer_time_botomsheet.dart';
import 'package:auto/features/car_single/presentation/widgets/more_actions_bottomsheet.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/main/domain/entities/ads_entity.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CarSingleScreen extends StatefulWidget {
  final AdsEntity adsEntity;
  const CarSingleScreen({required this.adsEntity, Key? key}) : super(key: key);

  @override
  State<CarSingleScreen> createState() => _CarSingleScreenState();
}

class _CarSingleScreenState extends State<CarSingleScreen> {
  late CarSingleBloc carSingleBloc;
  final Color color = white;
  late bool isLike;
  late bool isDisable;
  final ScrollController _scrollController = ScrollController();
  Color likeColor = white;
  String title = 'dasdasca';
  double height = 36;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    isDisable = true;
    isLike = false;
    carSingleBloc = CarSingleBloc(
      getCarSingleUseCase: GetCarSingleUseCase(
        repository: CarSingleRepositoryImpl(
          dataSource: CarSinglenDataSourceImpl(),
        ),
      ),
    );

    _scrollController.addListener(() {
      print(_scrollController.offset);
      if (_scrollController.offset > 225) {
        height = 100;
        likeColor = grey;
        setState(() {
          crossFadeState = CrossFadeState.showSecond;
        });
      } else if (_scrollController.offset > 295) {
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
  Widget build(BuildContext context) => BlocProvider.value(
        value: carSingleBloc,
        child: BlocBuilder<CarSingleBloc, CarSingleState>(builder: (context, state) {
          print('this is State ${state.carSingle}');
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      stretch: true,
                      pinned: true,
                      floating: false,
                      elevation: 0,
                      expandedHeight: 300,
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
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              AppIcons.heart,
                              height: 30,
                              width: 30,
                              color: likeColor,
                            ),
                          ),
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
                                builder: (context) => const MoreActions(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                              child: Text(
                                'Mercedes-Benz CLS 400 II (C218) AMG Рестайлинг Mercedes-Benz CLS 400 II (C218) AMG',
                                style: Theme.of(context).textTheme.headline4!.copyWith(
                                      color: dark,
                                    ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 8,
                                bottom: 12,
                                left: 16,
                                right: 16,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    widget.adsEntity.price,
                                    style: Theme.of(context).textTheme.headline2!.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: dark,
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  // WButton(
                                  //   onTap: () {
                                  //     showModalBottomSheet(
                                  //       useRootNavigator: true,
                                  //       backgroundColor: Colors.transparent,
                                  //       isScrollControlled: true,
                                  //       context: context,
                                  //       builder: (context) =>
                                  //           const CarPriceBottom(),
                                  //     );
                                  //   },
                                  //   height: 24,
                                  //   borderRadius: 6,
                                  //   color: blue,
                                  //   width: 24,
                                  //   child: SvgPicture.asset(
                                  //     AppIcons.chevronDown,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                16,
                                0,
                                16,
                                0,
                              ),
                              child: CarStatistics(),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                16,
                                0,
                                16,
                                0,
                              ),
                              child: Divider(
                                height: 32,
                                thickness: 1,
                                color: Theme.of(context).extension<ThemedColors>()!.solitudeToDarkRider,
                              ),
                            ),
                            const CarActions(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                16,
                                0,
                                16,
                                0,
                              ),
                              child: Divider(
                                thickness: 1,
                                color: Theme.of(context).extension<ThemedColors>()!.solitudeToDarkRider,
                              ),
                            ),
                            const CarDetails(),
                          ],
                        ),
                      ),
                    ),
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
                            color: Theme.of(context).extension<ThemedColors>()!.solitudeToDarkRider,
                          ),
                          color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const CarSellerCard(),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: DescriptionTabs(),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 12,
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
                        child: isDisable == false
                            ? WButton(
                                onTap: () {
                                  showModalBottomSheet(
                                    useRootNavigator: true,
                                    isScrollControlled: false,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => const DealerTime(),
                                  );
                                  // Navigator.of(context).push(fade(page: const DealerScreen()));
                                },
                                height: 44,
                                borderRadius: 8,
                                color: green,
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
                                    builder: (context) => const DealerTime(),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            AppImages.tahoe,
                            width: 44,
                            height: 44,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),  
              ],
            ),
          );
        }),
      );
}
