import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/ads/presentation/pages/ads_screen.dart';
import 'package:auto/features/commercial/presentation/commercial_screen.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
import 'package:auto/features/main/domain/entities/service_entity.dart';
import 'package:auto/features/main/domain/usecases/get_top_ads.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/main/presentation/bloc/main_bloc.dart';
import 'package:auto/features/main/presentation/bloc/top_ad/top_ad_bloc.dart';
import 'package:auto/features/main/presentation/bloc/top_brand/top_brand_bloc.dart';
import 'package:auto/features/main/presentation/parts/main_favorites.dart';
import 'package:auto/features/main/presentation/parts/main_map_part.dart';
import 'package:auto/features/main/presentation/parts/stories.dart';
import 'package:auto/features/main/presentation/parts/top_ads.dart';
import 'package:auto/features/main/presentation/parts/top_brands.dart';
import 'package:auto/features/main/presentation/widgets/car_model_item.dart';
import 'package:auto/features/main/presentation/widgets/check_bottomsheet.dart';
import 'package:auto/features/main/presentation/widgets/create_ad_button.dart';
import 'package:auto/features/main/presentation/widgets/deal_button.dart';
import 'package:auto/features/main/presentation/widgets/main_app_bar.dart';
import 'package:auto/features/main/presentation/widgets/service_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/reels/presentation/pages/reels_screen.dart';
import 'package:auto/features/rent/presentation/rent_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

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
      title: LocaleKeys.check,
      icon: AppIcons.verification,
    ),
    const ServiceEntity(
      title: LocaleKeys.ads,
      icon: AppIcons.ads,
    ),
    const ServiceEntity(
      title: LocaleKeys.carshering,
      icon: AppIcons.carSharing,
    ),
    const ServiceEntity(
      title: LocaleKeys.insurance,
      icon: AppIcons.insurance,
    ),
    const ServiceEntity(
      title: LocaleKeys.commercial_vehicles,
      icon: AppIcons.commercialCar,
    ),
    const ServiceEntity(
      title: LocaleKeys.rent_Car,
      icon: AppIcons.rentCar,
    ),
  ];

  @override
  void initState() {
    mainBloc = MainBloc()..add(InitialEvent());
    context.read<ProfileBloc>().add(GetProfileEvent());
    context.read<GetMakesBloc>().add(GetMakesBlocEvent.getMakes());
    topAdBloc = TopAdBloc(GetTopAdsUseCase())
      ..add(TopAdEvent.getTopAds())
      ..add(TopAdEvent.getFavorites());
    topBrandBloc = TopBrandBloc(GetTopBrandUseCase())
      ..add(TopBrandEvent.getBrand());
    serviceTaps = [
      () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          useRootNavigator: true,
          context: context,
          builder: (context) => CheckBottomsheet(onTap: () {}),
        );
      },
      () {
        context
            .read<GetCarModelBloc>()
            .add(GetCarModelEvent.selectedModelItem(id: -1, name: ''));
        context.read<GetMakesBloc>().add(
            GetMakesBlocEvent.selectedCarItems(id: -1, name: '', imageUrl: ''));
        context
            .read<AnnouncementListBloc>()
            .add(AnnouncementListEvent.getFilterClear(ismake: true));
        Navigator.of(context, rootNavigator: true)
            .push(fade(page: AdsScreen(isBack: false, onTap: () {})));
      },
      () {},
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
            value: topAdBloc,
          ),
          BlocProvider.value(
            value: topBrandBloc,
          ),
        ],
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) => Scaffold(
            backgroundColor:
                Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            appBar: const MainAppBar(),
            body: RefreshIndicator(
              color: purple,
              onRefresh: () async {
                mainBloc.add(InitialEvent());
                context.read<ProfileBloc>().add(GetProfileEvent());
                topBrandBloc.add(TopBrandEvent.getBrand());
                topAdBloc
                  ..add(TopAdEvent.getTopAds())
                  ..add(TopAdEvent.getFavorites());
              },
              child: BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
                builder: (context, stateAnnounc) => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 20, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible:
                            state.statusStoriesGet.isSubmissionInProgress ||
                                state.statusStoriesGet.isSubmissionSuccess &&
                                    state.stories.isNotEmpty,
                        child: Stories(
                          status: state.statusStoriesGet,
                          stories: state.stories,
                          onBack: () {
                            mainBloc.add(InitialEvent());
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      DealButton(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                              fade(page: const ReelsScreen(isFromMain: true)));
                        },
                      ),
                      BlocBuilder<GetMakesBloc, GetMakesState>(
                        builder: (context, state) => CarModelItem(
                            onTapSelect: () =>
                                Navigator.of(context, rootNavigator: true)
                                    .push(fade(
                                        page: ChooseCarBrandComparison(
                                  onTap: () {},
                                  isbak: true,
                                  isClear: true,
                                )))
                                    .then((value) {
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
                                  context.read<AnnouncementListBloc>().add(
                                      AnnouncementListEvent
                                          .getAnnouncementList());
                                }),
                            onTapShow: () {
                              Navigator.of(context, rootNavigator: true).push(
                                  fade(
                                      page: AdsScreen(
                                          isBack: false, onTap: () {})));
                            },
                            imageUrl: state.imageUrl,
                            title: state.name,
                            count: stateAnnounc.count,
                            isCheck: state.ischeck),
                      ),
                      SizedBox(
                        height: 64,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(right: 12,bottom: 16),
                            itemBuilder: (context, index) => ServiceItem(
                                  serviceEntity: serviceEntity[index],
                                  onTap: serviceTaps[index],
                                ),
                            itemCount: serviceEntity.length,
                            scrollDirection: Axis.horizontal),
                      ),
                      TopBrands(
                        onTap: () => Navigator.of(context, rootNavigator: true)
                            .push(fade(
                                page: AdsScreen(isBack: false, onTap: () {}))),
                      ),
                      const TopAds(),
                      BlocListener<WishlistAddBloc, WishlistAddState>(
                        listener: (context, stateWish) {
                          if (stateWish.addStatus.isSubmissionSuccess ||
                              stateWish.removeStatus.isSubmissionSuccess) {
                            context.read<TopAdBloc>().add(
                                TopAdEvent.getFavorites());
                            context
                                .read<WishlistAddBloc>()
                                .add(WishlistAddEvent.clearState());
                          }
                        },
                        child: MainFavorites(),
                      ),
                      const MainMapPart(),
                      const CreateAdButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
