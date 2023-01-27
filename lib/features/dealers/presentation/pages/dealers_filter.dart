import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_card_bloc/dealer_card_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/filter_bloc/dealer_filter_bloc.dart';
import 'package:auto/features/dealers/presentation/widgets/filter_radio.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_maker.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/features/search/presentation/widgets/selector_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealersFilterScreen extends StatefulWidget {
  final List<Region>? regions;
  final MakeEntity? maker;
  final DealerCardBloc dealerBloc;
  final String? carType;

  const DealersFilterScreen(
      {required this.dealerBloc,
      this.maker,
      this.carType,
      this.regions,
      this.isDirectoryPage = false,
      Key? key})
      : super(key: key);
  final bool isDirectoryPage;

  @override
  State<DealersFilterScreen> createState() => _DealersFilterScreenState();
}

class _DealersFilterScreenState extends State<DealersFilterScreen> {
  late DealerFilterBloc filterBloc;
  late String selectedCategory;

  // List<Region>? newRegion;

  @override
  void initState() {
    selectedCategory = widget.carType ?? 'all';
    filterBloc = DealerFilterBloc(
      car_type: widget.carType,
      maker: widget.maker,
      region: widget.regions,
    );
    context.read<RegionsBloc>().add(RegionsEvent.getRegions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: widget.dealerBloc),
          BlocProvider.value(value: filterBloc),
        ],
        child: BlocBuilder<DealerFilterBloc, DealerFilterState>(
          builder: (context, state) => Scaffold(
            backgroundColor: white,
            appBar: WAppBar(
              boxShadow: const [],
              titleStyle:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16),
              extraActions: [
                Text(LocaleKeys.filter.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                const Spacer(
                  flex: 30,
                ),
                WScaleAnimation(
                  onTap: () {
                    filterBloc.add(DealerFilterClearEvent());
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
                          .subtitle1!
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterRadio(
                          value: 'all',
                          onChanged: (value) {
                            setState(() => selectedCategory = value);
                          },
                          currentValue: selectedCategory),
                      FilterRadio(
                          value: 'new',
                          onChanged: (value) {
                            setState(() => selectedCategory = value);
                          },
                          currentValue: selectedCategory),
                      FilterRadio(
                          value: 'used',
                          onChanged: (value) {
                            setState(() => selectedCategory = value);
                          },
                          currentValue: selectedCategory),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<List<Region>>(
                        isDismissible: false,
                        context: context,
                        useRootNavigator: true,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => RentChooseRegionBottomSheet(
                            checkedRegions: state.region.asMap(),
                            list: context.read<RegionsBloc>().state.regions),
                      ).then((value) {
                        filterBloc.add(DealerFilterSelectEvent(region: value));
                      });
                    },
                    hintText: (state.region.isEmpty)
                        ? LocaleKeys.choose_region.tr()
                        : state.region.first.title,
                    title: LocaleKeys.region.tr(),
                    hasArrowDown: true,
                  ),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<MakeEntity>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        useRootNavigator: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) =>
                            ChooseMaker(selectedId: state.maker?.id ?? -1),
                      ).then((value) {
                        filterBloc.add(DealerFilterSelectEvent(maker: value));
                      });
                    },
                    hintText: state.maker?.name ?? LocaleKeys.choose_brand.tr(),
                    title: LocaleKeys.brand.tr(),
                    hasArrowDown: true,
                  ),
                  const Spacer(),
                  WButton(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14),
                    onTap: () {
                      filterBloc.add(DealerFilterSelectEvent(
                        region: state.region,
                        maker: state.maker,
                        car_type: selectedCategory,
                      ));

                      widget.dealerBloc.add(DealerCardEvent.getFilterResult(
                        regionId: state.region.isEmpty
                            ? ''
                            : state.region.single.id.toString(),
                        mark: state.maker?.slug,
                        carType: selectedCategory,
                      ));
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
