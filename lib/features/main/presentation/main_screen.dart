import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';
import 'package:auto/features/commercial/presentation/commercial_screen.dart';
// import 'package:auto/features/commercial/presentation/commercial_screen.dart';
import 'package:auto/features/common/domain/entity/car_brand_entity.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/dealers/presentation/dealers_main.dart';
import 'package:auto/features/main/domain/entities/ads_entity.dart';
import 'package:auto/features/main/domain/entities/service_entity.dart';
import 'package:auto/features/main/domain/usecases/get_top_ads.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/main/presentation/bloc/top_ad/top_ad_bloc.dart';
import 'package:auto/features/main/presentation/bloc/top_brand/top_brand_bloc.dart';
import 'package:auto/features/main/presentation/parts/top_ads.dart';
import 'package:auto/features/main/presentation/parts/top_brands.dart';
import 'package:auto/features/main/presentation/widgets/car_model_item.dart';
import 'package:auto/features/main/presentation/widgets/deal_button.dart';
import 'package:auto/features/main/presentation/widgets/favourite_item.dart';
import 'package:auto/features/main/presentation/widgets/main_app_bar.dart';
import 'package:auto/features/main/presentation/widgets/service_item.dart';
import 'package:auto/features/main/presentation/widgets/story_data.dart';
import 'package:auto/features/main/presentation/widgets/story_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/presentation/rent_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TopBrandBloc topBrandBloc;
  late TopAdBloc topAdBloc;
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
    topAdBloc = TopAdBloc(GetTopAdsUseCase())..add(TopAdEvent.getTopAds());
    topBrandBloc = TopBrandBloc(GetTopBrandUseCase())
      ..add(TopBrandEvent.getBrand());
    serviceTaps = [
      () {
        print(' ===============   serviceTaps 0   ===============');
        Navigator.pushReplacement(context, fade(page: const DealerScreen()));
      },
      () {
        print(' ===============   serviceTaps 1   ===============');
      },
      () {
        print(' ===============   serviceTaps 2   ===============');
      },
      () {
        print(' ===============   serviceTaps 3   ===============');
      },
      () {
        print(
            ' ===============   comercials state button pressed   ===============');

        Navigator.of(context, rootNavigator: true)
            .push(fade(page: const CommercialScreen()));
      },
      () {
        print(' ===============   serviceTaps 5   ===============');
        Navigator.of(context, rootNavigator: true)
            .push(fade(page: const RentScreen()));
      }
    ];
    super.initState();
  }

  final List<AdsEntity> adsEntity = [
    const AdsEntity(
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
    const AdsEntity(
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
    const AdsEntity(
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
    const AdsEntity(
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

  late List<VoidCallback> serviceTaps = [];

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: topBrandBloc,
          ),
          BlocProvider.value(
            value: topAdBloc,
          ),
        ],
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: const MainAppBar(),
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
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(right: 12),
                    itemBuilder: (context, index) => ServiceItem(
                      serviceEntity: serviceEntity[index],
                      onTap: serviceTaps[index],
                    ),
                    itemCount: serviceEntity.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const TopBrands(),
                const TopAds(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    LocaleKeys.favorites.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18),
                    // () => Navigator.pushReplacement(context, fade(page: const CommercialScreen())),
                    // () => Navigator.of(context, rootNavigator: true).push(fade(page: const RentScreen())),

                    // child: GestureDetector(onTap: () {}, child: SvgPicture.asset(AppIcons.bell)),
                    // const TopAds(),
                  ),
                ),
                const FavouriteItem(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 191,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        const YandexMap(),
                        WButton(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DealerScreen(),
                              )),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 44,
                          color: white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                AppIcons.mapPin,
                                color: purple,
                                height: 15,
                                width: 13,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Показать всех дилеров',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
