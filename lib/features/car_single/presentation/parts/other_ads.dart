import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/main/domain/entities/ads_entity.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtherAds extends StatelessWidget {
  const OtherAds({Key? key}) : super(key: key);

  static const List<AdsEntity> list = const [
    AdsEntity(
        imageUrl:
            'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        place: 'г. Ташкент',
        price: '1 519 123 200 UZS',
        aboutCar: 'Land Cruiser, 145 894 км,\nВнедорожник 5дв, АКПП, Дизел...',
        carName: 'Hyundai Genesis G90 long'),
    AdsEntity(
        imageUrl:
            'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        place: 'г. Ташкент',
        price: '1 519 123 200 UZS',
        aboutCar: 'Land Cruiser, 145 894 км,\nВнедорожник 5дв, АКПП, Дизел...',
        carName: 'Hyundai Genesis G90 long'),
    AdsEntity(
        imageUrl:
            'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        place: 'г. Ташкент',
        price: '1 519 123 200 UZS',
        aboutCar: 'Land Cruiser, 145 894 км,\nВнедорожник 5дв, АКПП, Дизел...',
        carName: 'Hyundai Genesis G90 long'),
  ];

  @override
  Widget build(BuildContext context) => Container(
        color: dark1,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              height: 1,
              thickness: 1,
              color: strokeDark,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Другие объявления:',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                color: dark,
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
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: secondary),
                    height: 36,
                    child: Center(
                      child: SvgPicture.asset(AppIcons.crown),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    list.length, (index) => AdsItem(adsEntity: list[index])),
              ),
            )
          ],
        ),
      );
}
