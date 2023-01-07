import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/commercial/presentation/commercial_screen.dart';

import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/dealers/presentation/dealers_main.dart';
import 'package:auto/features/main/domain/entities/service_entity.dart';
import 'package:auto/features/main/domain/usecases/get_top_ads.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/main/presentation/bloc/main_bloc.dart';
import 'package:auto/features/main/presentation/bloc/top_ad/top_ad_bloc.dart';
import 'package:auto/features/main/presentation/bloc/top_brand/top_brand_bloc.dart';
import 'package:auto/features/main/presentation/pages/select_car_model.dart';
import 'package:auto/features/main/presentation/pages/story_screen.dart';
import 'package:auto/features/main/presentation/parts/top_ads.dart';
import 'package:auto/features/main/presentation/parts/top_brands.dart';
import 'package:auto/features/main/presentation/widgets/car_model_item.dart';
import 'package:auto/features/main/presentation/widgets/deal_button.dart';
import 'package:auto/features/main/presentation/widgets/favourite_item.dart';
import 'package:auto/features/main/presentation/widgets/main_app_bar.dart';
import 'package:auto/features/main/presentation/widgets/service_item.dart';
import 'package:auto/features/main/presentation/widgets/story_item.dart';
import 'package:auto/features/main/presentation/widgets/story_shimmer_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reels/presentation/pages/reels_screen.dart';
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
  late MainBloc mainBloc;
  late TopBrandBloc topBrandBloc;
  late TopAdBloc topAdBloc;
  late List<VoidCallback> serviceTaps = [];

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
    mainBloc = MainBloc()..add(InitialEvent());
    topAdBloc = TopAdBloc(GetTopAdsUseCase())..add(TopAdEvent.getTopAds());
    topBrandBloc = TopBrandBloc(GetTopBrandUseCase())
      ..add(TopBrandEvent.getBrand());
    serviceTaps = [
      () {
        Navigator.pushReplacement(context, fade(page: const DealerScreen()));
      },
      () async {
        /// for testing purpose
        // await StorageRepository.putString('token', '');
        // await StorageRepository.putBool(key: 'onboarding', value: false);
      },
      () {
        
        /// for testing purpose
        // var onboarding = StorageRepository.getBool('onboarding');
        // var token = StorageRepository.getString('token');
     },
      () {},
      () {
        Navigator.of(context, rootNavigator: true)
            .push(fade(page: const CommercialScreen()));
      },
      () {
        Navigator.of(context, rootNavigator: true)
            .push(fade(page: const RentScreen()));
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: mainBloc,
          ),
          BlocProvider.value(
            value: topBrandBloc,
          ),
          BlocProvider.value(
            value: topAdBloc,
          ),
        ],
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) => Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: const MainAppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 96,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) => state.stories.isEmpty
                          ? const StoryShimmerItem()
                          : StoryItem(
                              title: state.stories[index].name,
                              image: state
                                  .stories[index].coverImageThumbnail.square,
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(fade(
                                        page: StoryScreen(
                                  stories: state.stories,
                                  index: index,
                                )));
                              },
                              isRead: state.stories[index].isRead,
                            ),
                      itemCount:
                          state.stories.isEmpty ? 5 : state.stories.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DealButton(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(fade(page: const ReelsScreen()));
                    },
                  ),
                  CarModelItem(
                    count: 1,
                    onTapSelect: () =>
                        Navigator.of(context, rootNavigator: true)
                            .push(fade(page: const SelectCarModelScreen())),
                    onTapShow: () {},
                  ),
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
        ),
      );
}
