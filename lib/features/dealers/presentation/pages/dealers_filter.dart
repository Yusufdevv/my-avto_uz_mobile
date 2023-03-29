import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/data/models/dealer_card_model.dart';
import 'package:auto/features/dealers/domain/entities/dealer_card_entity.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_card_bloc/dealer_card_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/filter_bloc/dealer_filter_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_selector_item.dart';
import 'package:auto/features/dealers/presentation/widgets/filter_radio.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_maker.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealersFilterScreen extends StatefulWidget {
  final List<RegionEntity>? regions;
  final MakeEntity? maker;
  final DealerCardBloc dealerBloc;
  final MapOrganizationBloc mapOrganizationBloc;
  final DealerFilterBloc dealerFilterBloc;
  final String? carType;

  const DealersFilterScreen({
    required this.dealerBloc,
    required this.dealerFilterBloc,
    required this.mapOrganizationBloc,
    this.maker,
    this.carType,
    this.regions,
    this.isDirectoryPage = false,
    Key? key,
  }) : super(key: key);
  final bool isDirectoryPage;

  @override
  State<DealersFilterScreen> createState() => _DealersFilterScreenState();
}

class _DealersFilterScreenState extends State<DealersFilterScreen> {
  late String selectedCategory;

  // List<Region>? newRegion;

  @override
  void initState() {
    selectedCategory = widget.carType ?? 'all';
    context.read<RegionsBloc>().add(RegionsEvent.getRegions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: widget.dealerBloc),
          BlocProvider.value(value: widget.mapOrganizationBloc),
        ],
        child: BlocBuilder<DealerFilterBloc, DealerFilterState>(
          builder: (context, state) => Scaffold(
            backgroundColor: Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
            appBar: WAppBar(
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 24,
                    color: dark.withOpacity(0.08)),
                BoxShadow(
                    offset: const Offset(0, -1), color: dark.withOpacity(0.08))
              ],
              titleStyle: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 16),
              extraActions: [
                Text(LocaleKeys.filter.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                const Spacer(
                  flex: 30,
                ),
                WScaleAnimation(
                  onTap: () {
                    widget.dealerFilterBloc.add(DealerFilterClearEvent());
                    setState(() {
                      selectedCategory = 'all';
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      LocaleKeys.clear.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: blue),
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocaleKeys.car_dealers.tr(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .greySuitToWhite)),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterRadio(
                            value: 'all',
                            onChanged: (value) {
                              setState(() => selectedCategory = value);
                              widget.dealerFilterBloc
                                  .add(DealerFilterSelectEvent(carType: value));
                            },
                            currentValue: selectedCategory),
                        const SizedBox(width: 12),
                        FilterRadio(
                            value: 'new',
                            onChanged: (value) {
                              setState(() => selectedCategory = value);
                              widget.dealerFilterBloc
                                  .add(DealerFilterSelectEvent(carType: value));
                            },
                            currentValue: selectedCategory),
                        const SizedBox(width: 12),
                        FilterRadio(
                            value: 'used',
                            onChanged: (value) {
                              setState(() => selectedCategory = value);
                              widget.dealerFilterBloc
                                  .add(DealerFilterSelectEvent(carType: value));
                            },
                            currentValue: selectedCategory),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  DealerSelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<List<RegionEntity>>(
                        isDismissible: false,
                        context: context,
                        useRootNavigator: true,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => RentChooseRegionBottomSheet(
                            checkedRegions: state.region.asMap(),
                            list: context.read<RegionsBloc>().state.regions),
                      ).then((value) {
                        widget.dealerFilterBloc
                            .add(DealerFilterSelectEvent(region: value));
                      });
                    },
                    hintText: MyFunctions.regionsToToText(state.region ),
                    title: LocaleKeys.region.tr(),
                    defaultText: LocaleKeys.choose_region.tr(),
                  ),
                  DealerSelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<MakeEntity>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        useRootNavigator: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => ChooseMaker(selectedMake: state.maker),
                      ).then((value) {
                        widget.dealerFilterBloc
                            .add(DealerFilterSelectEvent(maker: value));
                      });
                    },
                    hintText: state.maker.name,
                    title: LocaleKeys.brand.tr(),
                    defaultText: LocaleKeys.choose_brand.tr(),
                  ),
                  const Spacer(),
                  WButton(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14),
                    onTap: () {
                      widget.dealerBloc.add(DealerCardEvent.getResults(
                          isRefresh: false,
                          search: '',
                          regionId: state.region.isEmpty
                              ? ''
                              : MyFunctions.regionsToApi(state.region),
                          mark: state.maker.id != -1 ? state.maker.id : null,
                          carType: selectedCategory,
                          onSuccess: (list) {
                            widget.mapOrganizationBloc.add(
                                MapOrganizationEvent.setMapPoints(
                                    list: list
                                        .map((e) => DealerCardModel.fromJson(
                                            const DealerCardConvert()
                                                .toJson(e)))
                                        .toList()));
                          }));
                      Navigator.pop(context);
                    },
                    text: LocaleKeys.apply.tr(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
