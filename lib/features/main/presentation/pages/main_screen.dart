import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/features/common/domain/entity/car_brand_entity.dart';
import 'package:auto/features/common/widgets/car_brand_item.dart';
import 'package:auto/features/main/domain/entities/ads_entity.dart';
import 'package:auto/features/main/domain/entities/service_entity.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/main/presentation/widgets/car_model_item.dart';
import 'package:auto/features/main/presentation/widgets/deal_button.dart';
import 'package:auto/features/main/presentation/widgets/favourite_item.dart';
import 'package:auto/features/main/presentation/widgets/service_item.dart';
import 'package:auto/features/main/presentation/widgets/story_data.dart';
import 'package:auto/features/main/presentation/widgets/story_item.dart';
import 'package:auto/features/main/presentation/widgets/yandex_map.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/presentation/rent_screen.dart';
import 'package:auto/features/search/presentation/pages/commercial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<CarBrandEntity> carBrandEntity = [
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
  ];

  final List<ServiceEntity> serviceEntity = [
    const ServiceEntity(
      title: 'Проверка',
      icon: AppIcons.verification,
    ),
    const ServiceEntity(title: 'Объявления', icon: AppIcons.ads),
    const ServiceEntity(
      title: 'Каршеринг',
      icon: AppIcons.carSharing,
    ),
    const ServiceEntity(
      title: 'Страхование',
      icon: AppIcons.insurance,
    ),
    const ServiceEntity(
      title: 'Коммерческий транспорт',
      icon: AppIcons.commercialCar,
    ),
    const ServiceEntity(
      title: 'RentCar',
      icon: AppIcons.rentCar,
    ),
  ];
  @override
  void initState() {
    serviceTaps = [
      () {},
      () {},
      () {},
      () {},
      () => Navigator.pushReplacement(
          context, fade(page: const CommercialScreen())),
      () {},
    ];
    super.initState();
  }

  final List<AdsEntity> adsEntity = [
    const AdsEntity(
        imageUrl:
            'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        place: 'г. Ташкент',
        price: '1 519 123 200 UZS',
        aboutCar: 'Land Cruiser, 145 894 км,\nВнедорожник 5дв, АКПП, Дизел...',
        carName: 'Hyundai Genesis G90 long'),
    const AdsEntity(
        imageUrl:
            'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        place: 'г. Ташкент',
        price: '1 519 123 200 UZS',
        aboutCar: 'Land Cruiser, 145 894 км,\nВнедорожник 5дв, АКПП, Дизел...',
        carName: 'Hyundai Genesis G90 long'),
    const AdsEntity(
        imageUrl:
            'https://cdn.motor1.com/images/mgl/LBl63/s1/2021-genesis-g80.jpg',
        place: 'г. Ташкент',
        price: '1 519 123 200 UZS',
        aboutCar: 'Land Cruiser, 145 894 км,\nВнедорожник 5дв, АКПП, Дизел...',
        carName: 'Hyundai Genesis G90 long'),
  ];

  late List<VoidCallback> serviceTaps = [];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: SvgPicture.asset(
            Theme.of(context).extension<ThemedIcons>()!.imageUrl,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(AppIcons.bell),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 96,
                child: ListView.builder(
                  itemBuilder: (context, index) => StoryItem(
                    storyItemEntity: storyItemsEntity[index],
                  ),
                  itemCount: storyItemsEntity.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 16),
              const DealButton(),
              const CarModelItem(),
              SizedBox(
                height: 48,
                child: ListView.builder(
                  padding: const EdgeInsets.only(right: 12),
                  itemBuilder: (context, index) => ServiceItem(
                    serviceEntity: serviceEntity[index],
                    onTap: serviceTaps[index],
                  ),
                  itemCount: serviceEntity.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Топ марок автомобилей',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CarBrandItem(
                    carBrandEntity: carBrandEntity[index],
                    hasShadow: true,
                  ),
                  itemCount: carBrandEntity.length,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Лучшие предложения',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 276,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      AdsItem(adsEntity: adsEntity[index]),
                  itemCount: adsEntity.length,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Избраннные',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18),
                ),
              ),
              const FavouriteItem(),
              const YandexMapItem(),
            ],
          ),
        ),
      );
}
