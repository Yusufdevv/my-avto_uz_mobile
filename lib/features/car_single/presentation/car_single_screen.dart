import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/car_single/data/repository/car_single_repository_impl.dart';
import 'package:auto/features/car_single/domain/usecases/get_ads_usecase.dart';
import 'package:auto/features/car_single/presentation/bloc/car_single_bloc.dart';
import 'package:auto/features/car_single/presentation/parts/car_actions.dart';
import 'package:auto/features/car_single/presentation/parts/car_details.dart';
import 'package:auto/features/car_single/presentation/parts/car_seller_card.dart';
import 'package:auto/features/car_single/presentation/parts/cars_image_slider.dart';
import 'package:auto/features/car_single/presentation/parts/characteristics/car_characteristic.dart';
import 'package:auto/features/car_single/presentation/parts/description_tabs.dart';
import 'package:auto/features/car_single/presentation/parts/other_ads.dart';
import 'package:auto/features/car_single/presentation/parts/owner_actions.dart';
import 'package:auto/features/car_single/presentation/parts/statistics.dart';
import 'package:auto/features/car_single/presentation/widgets/car_price_bottom.dart';
import 'package:auto/features/car_single/presentation/widgets/dealer_time_botomsheet.dart';
import 'package:auto/features/car_single/presentation/widgets/more_actions_bottomsheet.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CarSingleScreen extends StatefulWidget {
  const CarSingleScreen({Key? key}) : super(key: key);

  @override
  State<CarSingleScreen> createState() => _CarSingleScreenState();
}

class _CarSingleScreenState extends State<CarSingleScreen> {
  final Color color = white;
  late GetAdsUseCase useCase;

  @override
  void initState() {
    useCase =
        GetAdsUseCase(repository: serviceLocator<CarSingleRepositoryImpl>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => CarSingleBloc(useCase)..add(GetCarSingleEvent()),
        child: BlocBuilder<CarSingleBloc, CarSingleState>(
          builder: (context, state) => Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Stack(
              children: [
                CustomScrollView(
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
                              color: color,
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
                      flexibleSpace: const FlexibleSpaceBar(
                        stretchModes: <StretchMode>[
                          StretchMode.zoomBackground,
                        ],
                        background: CarsImageSlider(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteToDark,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                              child: Text(
                                'Mercedes-Benz CLS 400 II (C218) AMG Рестайлинг Mercedes-Benz CLS 400 II (C218) AMG',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 8, bottom: 12, left: 16, right: 16),
                              child: Row(
                                children: [
                                  Text(
                                    '123 488 000 000 UZS',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  WButton(
                                    onTap: () {
                                      showModalBottomSheet(
                                        useRootNavigator: true,
                                        backgroundColor: Colors.transparent,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) =>
                                            const CarPriceBottom(),
                                      );
                                    },
                                    height: 24,
                                    borderRadius: 6,
                                    color: blue,
                                    width: 24,
                                    child: SvgPicture.asset(
                                      AppIcons.chevronDown,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: CarStatistics(),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: Divider(
                                height: 32,
                                thickness: 1,
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .solitudeToDarkRider,
                              ),
                            ),
                            const CarActions(),
                            Divider(
                              thickness: 1,
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .solitudeToDarkRider,
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
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .solitudeToDarkRider,
                          ),
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteToDark,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
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
                        child: WButton(
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
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          AppImages.tahoe,
                          width: 44,
                          height: 44,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
