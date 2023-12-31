import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ads/presentation/pages/ads_screen.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand_page.dart';
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
import 'package:auto/features/main/presentation/widgets/create_ad_button.dart';
import 'package:auto/features/main/presentation/widgets/deal_button.dart';
import 'package:auto/features/main/presentation/widgets/main_app_bar.dart';
import 'package:auto/features/main/presentation/widgets/service_item.dart';
import 'package:auto/features/main/presentation/widgets/soon_bottomsheet.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/features/reels/presentation/pages/reels_screen.dart';
import 'package:auto/features/rent/presentation/rent_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({required this.parentContext, Key? key}) : super(key: key);
  final BuildContext parentContext;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainBloc mainBloc;
  late TopBrandBloc topBrandBloc;
  late TopAdBloc topAdBloc;
  late List<VoidCallback> serviceTaps = [];
  late TutorialCoachMark tutorialCoachMark;

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
    mainBloc = MainBloc()
      ..add(InitialEvent())
      ..add(GetAnnouncement());
    // tutorialCoachMark = TutorialCoachMark(
    //   targets: [
    //     TargetFocus(
    //       targetPosition: TargetPosition(
    //         const Size(200, 100),
    //         Offset.zero,
    //       ),
    //       alignSkip: Alignment.topRight,
    //       contents: [
    //         TargetContent(
    //           align: ContentAlign.top,
    //           builder: (context, controller) => Stories(
    //             status: context.read<MainBloc>().state.statusStoriesGet,
    //             stories: context.read<MainBloc>().state.stories,
    //             onBack: () {
    //               mainBloc.add(
    //                 InitialEvent(),
    //               );
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    //   colorShadow: Colors.red,
    //   textSkip: "SKIP",
    //   paddingFocus: 10,
    //   opacityShadow: 0.8,
    //   onFinish: () {
    //     print("finish");
    //   },
    //   onClickTarget: (target) {
    //     print('onClickTarget: $target');
    //   },
    //   onClickTargetWithTapPosition: (target, tapDetails) {
    //     print("target: $target");
    //     print(
    //         "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
    //   },
    //   onClickOverlay: (target) {
    //     print('onClickOverlay: $target');
    //   },
    //   onSkip: () {
    //     print("skip");
    //   },
    // );
    Future.delayed(Duration.zero, showTutorial);

    context.read<ProfileBloc>().add(GetProfileEvent());
    context.read<ProfileBloc>().add(GetNoReadNotificationsEvent(filter: 0));
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
          builder: (context) => const SoonBottomsheet(),
        );
      },
      () {
        Navigator.of(context, rootNavigator: true)
            .push(fade(page: const AdsScreen()));
      },
      () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          useRootNavigator: true,
          context: context,
          builder: (context) => const SoonBottomsheet(),
        );
      },
      () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          useRootNavigator: true,
          context: context,
          builder: (context) => const SoonBottomsheet(),
        );
      },
      () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          useRootNavigator: true,
          context: context,
          builder: (context) => const SoonBottomsheet(),
        );
        // Navigator.of(context, rootNavigator: true)
        //     .push(fade(page: const CommercialScreen()));
      },
      () {
        Navigator.of(context, rootNavigator: true)
            .push(fade(page: const RentScreen()));
      }
    ];
    super.initState();
  }

  void showTutorial() {
    tutorialCoachMark.show(context: context);
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
                Theme.of(context).extension<ThemedColors>()!.whiteToBlack,
            appBar: const MainAppBar(),
            body: RefreshIndicator(
              backgroundColor: Colors.grey.shade200,
              color: orange,
              onRefresh: () async {
                mainBloc
                  ..add(InitialEvent())
                  ..add(GetAnnouncement());
                context.read<ProfileBloc>().add(GetProfileEvent());
                context
                    .read<ProfileBloc>()
                    .add(GetNoReadNotificationsEvent(filter: 0));
                topBrandBloc.add(TopBrandEvent.getBrand());
                topAdBloc
                  ..add(TopAdEvent.getTopAds())
                  ..add(TopAdEvent.getFavorites());
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 20, bottom: 24),
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
                        onBack: () {
                          mainBloc.add(InitialEvent());
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    DealButton(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            fade(page: const ReelsScreen(isForOfferDay: true)));
                      },
                    ),
                    CarModelItem(
                      onTapSelect: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(
                          fade(
                            page: ChooseCarMakeAndModelPage(
                              selectedMake: state.make,
                              selectedModelId: state.model?.id ?? -1,
                              announcementCount: state.announcementCount,
                            ),
                          ),
                        )
                            .then((value) {
                          if (value != null) {
                            if (value is Map<String, dynamic>) {
                              final MakeEntity model = value['model'];
                              final MakeEntity make = value['make'];

                              mainBloc
                                ..add(
                                  GetMakeModelEvent(
                                    make: make,
                                    model: model,
                                    historySaved: false,
                                  ),
                                )
                                ..add(GetAnnouncement());
                              Navigator.of(context, rootNavigator: true)
                                  .push(
                                fade(
                                  page: AdsScreen(
                                    make: make,
                                    model: model,
                                    historySaved: false,
                                  ),
                                ),
                              )
                                  .then((value) {
                                if (value != null && value) {
                                  mainBloc.add(
                                    const GetMakeModelEvent(
                                      model: MakeEntity(),
                                      make: MakeEntity(),
                                      historySaved: true,
                                    ),
                                  );
                                }
                              });
                            } else {
                              mainBloc
                                ..add(const GetMakeModelEvent(
                                    make: MakeEntity(),
                                    model: MakeEntity(),
                                    historySaved: true))
                                ..add(GetAnnouncement());
                            }
                          }
                        });
                      },
                      onTapShow: () {
                        Navigator.of(context, rootNavigator: true).push(
                          fade(
                            page: AdsScreen(
                              model: state.model,
                              make: state.make,
                              historySaved: state.historySaved,
                            ),
                          ),
                        );
                      },
                      imageUrl: state.make?.logo ?? '',
                      title:
                          '${state.make?.name ?? ''} ${state.model?.name ?? ''}',
                      count: state.announcementCount,
                      isCheck: true,
                    ),
                    SizedBox(
                      height: 64,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(right: 16, bottom: 16),
                          itemBuilder: (context, index) => ServiceItem(
                                serviceEntity: serviceEntity[index],
                                onTap: serviceTaps[index],
                              ),
                          itemCount: serviceEntity.length - 1,
                          scrollDirection: Axis.horizontal),
                    ),
                    TopBrands(
                      onTap: (selectedMake) {
                        Navigator.of(context, rootNavigator: true).push(
                          fade(
                            page: AdsScreen(
                              make: selectedMake,
                            ),
                          ),
                        );
                      },
                    ),
                    const TopAds(),
                    BlocListener<WishlistAddBloc, WishlistAddState>(
                      listener: (context, stateWish) {
                        if (stateWish.addStatus.isSubmissionSuccess ||
                            stateWish.removeStatus.isSubmissionSuccess) {
                          context
                              .read<TopAdBloc>()
                              .add(TopAdEvent.getFavorites());
                          context
                              .read<WishlistAddBloc>()
                              .add(WishlistAddEvent.clearState());
                        }
                      },
                      child: MainFavorites(
                        parentContext: widget.parentContext,
                      ),
                    ),
                    const MainMapPart(),
                    const CreateAdButton(),
                    if (context.watch<MainBloc>().state.stories.isEmpty &&
                        context.watch<TopBrandBloc>().state.brands.isEmpty) ...{
                      const SizedBox(height: 200),
                    }
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
