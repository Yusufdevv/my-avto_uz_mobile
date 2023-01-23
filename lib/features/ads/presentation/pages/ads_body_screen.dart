import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ads/presentation/pages/filter_parameters.dart';
import 'package:auto/features/car_single/presentation/car_single_screen.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AdsBodyScreen extends StatefulWidget {
  final ScrollController scrollController;
  final bool? isNew;
  const AdsBodyScreen({
    required this.scrollController,
    this.isNew,
    super.key,
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
    context.read<AnnouncementListBloc>().add(AnnouncementListEvent.getFilter(
        context.read<AnnouncementListBloc>().state.filter.copyWith(
              isNew: widget.isNew,
            )));
    context.read<RegionsBloc>().add(RegionsEvent.getRegions());
    context
        .read<AnnouncementListBloc>()
        .add(AnnouncementListEvent.getAnnouncementList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return BlocBuilder<AnnouncementListBloc, AnnouncementListState>(
      bloc: context.read<AnnouncementListBloc>(),
      builder: (context, state) {
        var list = List<AnnouncementListEntity>.from(state.announcementList);
        if (state.status == FormzStatus.submissionInProgress) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state.status == FormzStatus.submissionSuccess ||
            state.status == FormzStatus.submissionFailure) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            controller: widget.scrollController,
            children: [
              const SizedBox(height: 16),
              CommercialCarModelItem(
                  title: context.read<GetMakesBloc>().state.name,
                  subtitle: context.read<GetCarModelBloc>().state.name,
                  imageUrl: context.read<GetMakesBloc>().state.imageUrl,
                  onTap: () {
                    Navigator.push(
                        context,
                        fade(
                            page: ChooseCarBrandComparison(
                                isClear: false,
                                onTap: () => Navigator.of(context)
                                        .push(fade(
                                            page: ChooseCarModelComparison(
                                                isClear: false,
                                                onTap: () {
                                                  context
                                                      .read<
                                                          AnnouncementListBloc>()
                                                      .add(AnnouncementListEvent
                                                          .getFilter(
                                                        state.filter.copyWith(
                                                            make: context
                                                                .read<
                                                                    GetMakesBloc>()
                                                                .state
                                                                .selectId,
                                                            model: context
                                                                .read<
                                                                    GetCarModelBloc>()
                                                                .state
                                                                .selectedId),
                                                      ));
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                })))
                                        .then((value) {
                                      context.read<AnnouncementListBloc>().add(
                                          AnnouncementListEvent.getIsHistory(
                                              context
                                                      .read<GetMakesBloc>()
                                                      .state
                                                      .selectId <=
                                                  0));
                                      context.read<AnnouncementListBloc>().add(
                                          AnnouncementListEvent
                                              .getAnnouncementList());
                                    }))));
                  }),
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
                      claerA: state.isFilter,
                      activeColor: orange,
                      defaultTitle: 'Параметры',
                      onTap: () {
                        Navigator.of(context).push(
                          fade(
                            page: FilterParameters(
                              bloc: context.read<AnnouncementListBloc>(),
                              bodyType: state.bodyTypeEntity,
                              gearboxType: state.gearboxTypeEntity,
                              carDriveType: state.driveTypeEntity,
                              yearValues: state.yearValues,
                              priceValues: state.priceValues,
                              idVal: state.idVal,
                              ischek: state.isFilter,
                            ),
                          ),
                        );
                      },
                      onTapClear: () {
                        context.read<AnnouncementListBloc>().add(
                            AnnouncementListEvent.getInfo(isFilter: false));
                        context
                            .read<AnnouncementListBloc>()
                            .add(AnnouncementListEvent.getFilterClear());
                        context
                            .read<AnnouncementListBloc>()
                            .add(AnnouncementListEvent.getAnnouncementList());
                      },
                    ),
                    WFilterButton(
                      size: size,
                      theme: theme,
                      icon: AppIcons.location,
                      name: state.regions.isNotEmpty
                          ? state.regions[0].title
                          : '',
                      claerA: state.regions.isNotEmpty,
                      activeColor: dark,
                      defaultTitle: 'Все регионы',
                      onTap: () async {
                        await showModalBottomSheet<List<Region>>(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) => RentChooseRegionBottomSheet(
                            checkedRegions: state.regions.asMap(),
                            list: context.read<RegionsBloc>().state.regions,
                          ),
                        ).then((value) {
                          print(
                              '===> ==> Bu Valu ${value!.map((e) => '${e.id}').toList().join(',')}');

                          context
                              .read<AnnouncementListBloc>()
                              .add(AnnouncementListEvent.getRegions(value));
                          context
                              .read<AnnouncementListBloc>()
                              .add(AnnouncementListEvent.getAnnouncementList());
                        });
                      },
                      onTapClear: () {
                        context
                            .read<AnnouncementListBloc>()
                            .add(AnnouncementListEvent.getRegions([]));
                        context
                            .read<AnnouncementListBloc>()
                            .add(AnnouncementListEvent.getAnnouncementList());
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              if (state.announcementList.isNotEmpty)
                ...List.generate(
                  state.announcementList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(fade(
                            page: CarSingleScreen(
                                id: state.announcementList[index].id)));
                      },
                      child: InfoContainer(
                        index: index,
                        phone: state.announcementList[index].userType == 'owner'
                            ? state.announcementList[index].user.phoneNumber
                            : state.announcementList[index].dealer.phoneNumber,
                        avatarPicture:
                            state.announcementList[index].user.avatar,
                        carModel: state.announcementList[index].model,
                        hasDiscount:
                            state.announcementList[index].discount != 0,
                        location: state.announcementList[index].region,
                        owner:
                            state.announcementList[index].user.name.isNotEmpty
                                ? state.announcementList[index].user.name
                                : state.announcementList[index].user.fullName,
                        ownerType: state.announcementList[index].userType,
                        publishTime: MyFunctions.getDateNamedMonthEdit(
                            state.announcementList[index].publishedAt),
                        subtitle: state.announcementList[index].description,
                        year: state.announcementList[index].year,
                        price: MyFunctions.getFormatCost(
                            state.announcementList[index].price.toString()),
                        discountPrice: state.announcementList[index].discount ==
                                0
                            ? ''
                            : state.announcementList[index].discount.toString(),
                        sellType: '',
                        hasStatusInfo: state.announcementList[index].isNew,
                        gallery: state.announcementList[index].gallery,
                        currency: state.announcementList[index].currency,
                        initialLike: list[index].isWishlisted,
                        id: state.announcementList[index].id,
                        onTapComparsion: () {},
                        onTapFavorites: () {},
                        initialComparsions: list[index].isComparison,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 90),
              if (state.announcementList.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppIcons.carIcon,
                        height: 92,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Нет результатов',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'К соэалению, по вашему запросу результаты не найдены',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 14, color: greyText),
                      ),
                    ],
                  ),
                ),
            ],
          );
        }
        return const Center(
          child: Text('Error'),
        );
      },
    );
  }
}
