import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';
import 'package:auto/features/main/domain/entities/ads_entity.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OtherAds extends StatelessWidget {
  const OtherAds({Key? key}) : super(key: key);

  static const List<AdsEntity> list = [
    AdsEntity(
      imageUrl: [
        'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
      ],
      isWishlisted: true,
      description: 'description',
      generation: 'generation',
      make: 'make',
      year: 2000,
      latitude: 123.123,
      longitude: 123.432,
      viewCount: 11,
      id: 1,
      model: 'stark',
      region: 'tashkent',
      carUser: CarUserEntity(),
      price: '9898',
    ),
    AdsEntity(
      imageUrl: [
        'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
      ],
      isWishlisted: true,
      description: 'description',
      generation: 'generation',
      make: 'make',
      year: 2000,
      latitude: 123.123,
      longitude: 123.432,
      viewCount: 11,
      id: 1,
      model: 'stark',
      region: 'tashkent',
      carUser: CarUserEntity(),
      price: '9898',
    ),
    AdsEntity(
      imageUrl: [
        'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
      ],
      isWishlisted: true,
      description: 'description',
      generation: 'generation',
      make: 'make',
      year: 2000,
      latitude: 123.123,
      longitude: 123.432,
      viewCount: 11,
      id: 1,
      model: 'stark',
      region: 'tashkent',
      carUser: CarUserEntity(),
      price: '9898',
    ),
    AdsEntity(
      imageUrl: [
        'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
      ],
      isWishlisted: true,
      description: 'description',
      generation: 'generation',
      make: 'make',
      year: 2000,
      latitude: 123.123,
      longitude: 123.432,
      viewCount: 11,
      id: 1,
      model: 'stark',
      region: 'tashkent',
      carUser: CarUserEntity(),
      price: '9898',
    ),
  ];

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark, border: Border.all(color: border)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                LocaleKeys.Other_announcements.tr(),
                style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).extension<ThemedColors>()!.solitudeTo1Black,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Mercedes Benz',
                    style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: Theme.of(context).extension<ThemedColors>()!.whiteToEclipse,
                        border: Border.all(color: border)),
                    height: 36,
                    child: Center(
                      child: Image.asset(AppImages.mercLogo),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    list.length,
                    (index) => AdsItem(
                          adsEntity: list[index],
                        )),
              ),
            ),
          ],
        ),
      );
}
