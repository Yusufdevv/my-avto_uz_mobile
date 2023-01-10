import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/data/models/announcement_filter.dart';
import 'package:auto/features/ad/presentation/pages/ads/filter_parameters.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_car_model_item.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/w_filter_button.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
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
  final AnnouncementListBloc bloc;
  final ScrollController scrollController;
  const AdsBodyScreen({
    required this.bloc,
    super.key,
    required this.scrollController,
  });

  @override
  State<AdsBodyScreen> createState() => _AdsBodyScreenState();
}

class _AdsBodyScreenState extends State<AdsBodyScreen> {
  late RentBloc rentBloc;

  @override
  void initState() {
    rentBloc = RentBloc(rentUseCase: RentUseCase(), id: 5)
      ..add(RentGetResultsEvent(isRefresh: false));
    widget.bloc
        .add(AnnouncementListEvent.getFilter(widget.bloc.state.filter.copyWith(
      make: BlocProvider.of<GetMakesBloc>(context).state.selectedId,
      model: BlocProvider.of<GetCarModelBloc>(context).state.selectedId,
    )));
    widget.bloc.add(AnnouncementListEvent.getAnnouncementList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
      builder: (context, state) {
        var list = List<AnnouncementListEntity>.from(state.announcementList);
        return ListView(
          physics: const BouncingScrollPhysics(),
          controller: widget.scrollController,
          children: [
            const SizedBox(height: 16),
            BlocBuilder<GetMakesBloc, GetMakesState>(
              builder: (context, stateMakes) =>
                  BlocBuilder<GetCarModelBloc, GetCarModelState>(
                builder: (context, stateModel) => CommercialCarModelItem(
                  title: stateMakes.name,
                  subtitle: stateModel.name,
                  imageUrl: stateMakes.imageUrl,
                  onTap: () {
                    Navigator.push(
                      context,
                      fade(
                        page: ChooseCarBrandComparison(
                          onTap: () => Navigator.of(context).push(
                            fade(
                              page: ChooseCarModelComparison(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
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
                        rentBloc
                            .add(RentSetParamFromFilterEvent(regions: value));
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
                    callFrom:
                        state.announcementList[index].contactAvailableFrom,
                    callTo: state.announcementList[index].contactAvailableTo,
                  ),
                  gallery: state.announcementList[index].gallery,
                  currency: state.announcementList[index].currency,
                  initialLike: list[index].isWishlisted,
                  id: state.announcementList[index].id,
                  onTapComparsion: () {},
                  onTapFavorites: () {
                  },
                  initialComparsions: list[index].isComparison,
                ),
              ),
            ),
            const SizedBox(height: 90)
          ],
        );
      },
    );
  }
}
