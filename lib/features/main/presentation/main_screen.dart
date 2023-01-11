import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/presentation/pages/ads/ads_screen.dart';
import 'package:auto/features/commercial/presentation/commercial_screen.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';

import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
import 'package:auto/features/dealers/presentation/dealers_main.dart';
import 'package:auto/features/main/domain/entities/service_entity.dart';
import 'package:auto/features/main/domain/usecases/get_top_ads.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/main/presentation/bloc/main_bloc.dart';
import 'package:auto/features/main/presentation/bloc/top_ad/top_ad_bloc.dart';
import 'package:auto/features/main/presentation/bloc/top_brand/top_brand_bloc.dart';
import 'package:auto/features/main/presentation/parts/stories.dart';
import 'package:auto/features/main/presentation/parts/top_ads.dart';
import 'package:auto/features/main/presentation/parts/top_brands.dart';
import 'package:auto/features/main/presentation/widgets/car_model_item.dart';
import 'package:auto/features/main/presentation/widgets/deal_button.dart';
import 'package:auto/features/main/presentation/widgets/favourite_item.dart';
import 'package:auto/features/main/presentation/widgets/main_app_bar.dart';
import 'package:auto/features/main/presentation/widgets/service_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reels/presentation/pages/reels_screen.dart';
import 'package:auto/features/rent/presentation/rent_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
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
  int n = 10;

  @override
  void initState() {
    mainBloc = MainBloc()..add(InitialEvent());
    topAdBloc = TopAdBloc(GetTopAdsUseCase())..add(TopAdEvent.getTopAds());
    topBrandBloc = TopBrandBloc(GetTopBrandUseCase())
      ..add(TopBrandEvent.getBrand());
    serviceTaps = [
      () {
        Navigator.push(context, fade(page: const DealerScreen()));
      },
      () {
        context
            .read<GetCarModelBloc>()
            .add(GetCarModelEvent.selectedModelItem(id: -1, name: ''));
        context.read<GetMakesBloc>().add(
            GetMakesBlocEvent.selectedCarItems(id: -1, name: '', imageUrl: ''));
        Navigator.of(context).push(fade(page: AdsScreen(onBack: () {
          Navigator.of(context).pop();
        })));
      },
      () async {
        /// for testing purpose
        /// KAR SHARING
        // await StorageRepository.putString('token', '');
        // await StorageRepository.putBool(value: false, key: 'onboarding');
        // print('=>=>=>=> onboarding put false <=<=<=<=');
        // print('=>=>=>=> token put empty <=<=<=<=');
      },
      () async {},
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
            body: BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
              builder: (context, stateAnnounc) => SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: state.statusStoriesGet.isSubmissionInProgress ||
                          state.statusStoriesGet.isSubmissionSuccess &&
                              state.stories.isNotEmpty,
                      child: Stories(
                        status: state.statusStoriesGet,
                        stories: state.stories,
                      ),
                    ),
                    const SizedBox(height: 16),
                    DealButton(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(fade(page: const ReelsScreen()));
                      },
                    ),
                    BlocBuilder<GetMakesBloc, GetMakesState>(
                      builder: (context, state) => CarModelItem(
                        onTapSelect: () => Navigator.of(context).push(
                            fade(page: ChooseCarBrandComparison(onTap: () {
                          Navigator.pop(context);
                        }))).then((value) {
                          context.read<AnnouncementListBloc>().add(
                              AnnouncementListEvent.getFilter(context
                                  .read<AnnouncementListBloc>()
                                  .state
                                  .filter
                                  .copyWith(
                                    make: context
                                        .read<GetMakesBloc>()
                                        .state
                                        .selectId,
                                  )));
                          context
                              .read<AnnouncementListBloc>()
                              .add(AnnouncementListEvent.getAnnouncementList());
                        }),
                        onTapShow: () {},
                        imageUrl: state.imageUrl,
                        title: state.name,
                        count: stateAnnounc.count,
                      ),
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
                    BlocBuilder<TopBrandBloc, TopBrandState>(
                      builder: (context, state) => Visibility(
                        visible: state.status.isSubmissionInProgress ||
                            state.status.isSubmissionSuccess &&
                                state.brands.isNotEmpty,
                        child: TopBrands(
                          status: state.status,
                          brands: state.brands,
                        ),
                      ),
                    ),
                    BlocBuilder<TopAdBloc, TopAdState>(
                      builder: (context, state) => Visibility(
                        visible: true,
                        child: TopAds(
                          status: FormzStatus.pure,
                          topAds: state.topAds,
                        ),
                      ),
                    ),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
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
        ),
      );
}
