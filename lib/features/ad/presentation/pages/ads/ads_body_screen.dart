import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/car_type_selector_bloc.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_car_model_item.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/repository/add_wishlist_repository.dart';
import 'package:auto/features/common/usecases/add_wishlist_usecase.dart';
import 'package:auto/features/common/usecases/announcement_list_usecase.dart';
import 'package:auto/features/common/widgets/w_filter_button.dart';
import 'package:auto/features/comparison/presentation/bloc/filter_parameters_bloc/bloc/filter_parameters_bloc.dart';
import 'package:auto/features/ad/presentation/pages/ads/ads_screen.dart';
import 'package:auto/features/ad/presentation/pages/ads/filter_parameters.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
import 'package:auto/features/comparison/presentation/pages/choose_model.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/usecases/rent_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/rent_bloc/rent_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsBodyScreen extends StatefulWidget {
  final FilterParametersBloc filterParametersBloc;
  const AdsBodyScreen({
    required this.filterParametersBloc,
    super.key,
  });

  @override
  State<AdsBodyScreen> createState() => _AdsBodyScreenState();
}

class _AdsBodyScreenState extends State<AdsBodyScreen> {
  late RentBloc rentBloc;
  late AnnouncementListBloc bloc;
  late WishlistAddBloc wishlistAddBloc;
  final List<bool> hasDiscount = [true, false];

  final List<String> owner = ['Анвар Гулямов', 'ORIENT MOTORS'];

  final List<String> ownerType = ['Частное лицо', 'Автосалон'];

  final List<String> publishTime = ['Сегодня', '27 февраля'];

  final List<String> sellType = ['Продажа Автомобиля', 'Аренда c выкупом'];

  @override
  void initState() {
    rentBloc = RentBloc(rentUseCase: RentUseCase(), id: 5)
      ..add(RentGetResultsEvent(isRefresh: false));
    bloc = AnnouncementListBloc(
        useCase: AnnouncementListUseCase(
            repositoryImpl: serviceLocator<AdRepositoryImpl>()))
      ..add(AnnouncementListEvent.getAnnouncementList());
    wishlistAddBloc = WishlistAddBloc(
        useCase: AddWishlistUseCase(
            repo: serviceLocator<AddWishlistRepositoryImpl>()),
        removeWishlistUseCase: RemoveWishlistUseCase(
            repo: serviceLocator<AddWishlistRepositoryImpl>()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
      bloc: bloc,
      builder: (context, state) => ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 16),
          CommercialCarModelItem(
            title: BlocProvider.of<GetMakesBloc>(context).state.name,
            subtitle: BlocProvider.of<GetCarModelBloc>(context).state.name,
            imageUrl: BlocProvider.of<GetMakesBloc>(context).state.imageUrl,
            onTap: () {
              Navigator.push(
                context,
                fade(
                  page: ChooseCarBrandComparison(
                    onTap: () => Navigator.of(context).push(
                      fade(
                        page: ChooseCarModelComparison(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   fade(
                            //     page: ChooseGenerationComparison(
                            //       onTap: () {},
                            //       modelBloc: modelBloc,
                            //     ),
                            //   ),
                            // );
                            Navigator.of(context).push(
                              fade(
                                page: const AdsScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WFilterButton(
                  size: size,
                  theme: theme,
                  icon: AppIcons.filter,
                  name: '',
                  claerA: false,
                  activeColor: orange,
                  defaultTitle: 'Параметры',
                  onTap: () {
                    Navigator.of(context).push(
                      fade(
                        page: FilterParameters(
                          filterParametersBloc: widget.filterParametersBloc,
                          rentBloc: rentBloc,
                        ),
                      ),
                    );
                  },
                  onTapClear: () {},
                ),
                WFilterButton(
                  size: size,
                  theme: theme,
                  icon: AppIcons.location,
                  name: 'г. Ташкент',
                  claerA: true,
                  activeColor: dark,
                  defaultTitle: 'Все регионы',
                  onTap: () async {
                    await showModalBottomSheet<List<Region>>(
                      isDismissible: false,
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (c) => RentChooseRegionBottomSheet(
                          list: context.read<RegionsBloc>().state.regions),
                    ).then((value) {
                      rentBloc.add(RentSetParamFromFilterEvent(regions: value));
                    });
                  },
                  onTapClear: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(
            state.announcementList.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InfoContainer(
                avatarPicture: state.announcementList[index].user.avatar,
                carModel: state.announcementList[index].model,
                hasDiscount: state.announcementList[index].discount != 0,
                location: state.announcementList[index].region,
                owner: state.announcementList[index].user.name.isNotEmpty
                    ? state.announcementList[index].user.name
                    : state.announcementList[index].user.fullName,
                ownerType: state.announcementList[index].userType,
                publishTime: MyFunctions.getDateNamedMonthEdit(
                    state.announcementList[index].publishedAt),
                subtitle: state.announcementList[index].description,
                year: state.announcementList[index].year,
                price: state.announcementList[index].price.toString(),
                discountPrice: state.announcementList[index].discount == 0
                    ? ''
                    : state.announcementList[index].discount.toString(),
                sellType: '',
                hasStatusInfo: false,
                hasCallCard: MyFunctions.enableForCalling(
                  callFrom: state.announcementList[index].contactAvailableFrom,
                  callTo: state.announcementList[index].contactAvailableTo,
                ),
                gallery: state.announcementList[index].gallery,
                currency: state.announcementList[index].currency,
                initialLike: state.announcementList[index].isWishlisted,
                bloc: wishlistAddBloc,
                id: state.announcementList[index].id,
                onTapComparsion: () {},
                onTapFavorites: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
