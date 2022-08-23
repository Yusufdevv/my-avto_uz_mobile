import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/presentation/parts/car_actions.dart';
import 'package:auto/features/car_single/presentation/parts/car_details.dart';
import 'package:auto/features/car_single/presentation/parts/car_seller_card.dart';
import 'package:auto/features/car_single/presentation/parts/cars_image_slider.dart';
import 'package:auto/features/car_single/presentation/parts/characteristics/car_characteristic.dart';
import 'package:auto/features/car_single/presentation/parts/description_tabs.dart';
import 'package:auto/features/car_single/presentation/parts/descriptions/vin_info_list.dart';
import 'package:auto/features/car_single/presentation/parts/other_ads.dart';
import 'package:auto/features/car_single/presentation/parts/owner_actions.dart';
import 'package:auto/features/car_single/presentation/parts/statistics.dart';
import 'package:auto/features/car_single/presentation/widgets/car_price_bottom.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarSingleScreen extends StatelessWidget {
  const CarSingleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
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
                  SvgPicture.asset(
                    AppIcons.heart,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SvgPicture.asset(
                    AppIcons.moreVertical,
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              flexibleSpace: const FlexibleSpaceBar(
                stretchModes: <StretchMode>[
                  StretchMode.zoomBackground,
                ],
                background: CarsImageSlider(),
              ),
            )
          ],
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToDark,
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mercedes-Benz CLS 400 II (C218) AMG Рестайлинг Mercedes-Benz CLS 400 II (C218) AMG',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8, bottom: 12),
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
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        context: context,
                                        builder: (context) =>
                                            const CarPriceBottom());
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
                          CarStatistics(),
                          Divider(
                            height: 32,
                            thickness: 1,
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .solitudeToDarkRider,
                          ),
                          const CarActions(),
                          Container(
                              margin: const EdgeInsets.only(top: 4, bottom: 12),
                              child: Divider(
                                thickness: 1,
                                color: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .solitudeToDarkRider,
                              )),
                          const CarDetails(),
                        ],
                      ),
                    ),
                    Container(
                      color: background,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const OwnerActions(),
                    ),
                    Container(
                      color: dark1,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: const CarSellerCard(),
                    ),
                    const DescriptionTabs(),
                    const CarCharacteristic(),
                    const VinInfoList(),
                    const OtherAds(),
                    const SizedBox(
                      height: 44,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 4 + MediaQuery.of(context).padding.bottom,
                right: 0,
                left: 0,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: WButton(
                          onTap: () {},
                          height: 44,
                          borderRadius: 8,
                          color: green,
                          text: 'Позвонить',
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
              ),
            ],
          ),
        ),
      );
}
