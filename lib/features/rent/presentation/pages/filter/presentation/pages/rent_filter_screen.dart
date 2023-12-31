import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ads/presentation/bloc/filter/filter_bloc.dart';
import 'package:auto/features/ads/presentation/pages/filter_parameters.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/widgets/range_slider.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/features/rent/presentation/bloc/rent_bloc/rent_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_body_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_drive_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_gearbox.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_maker.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:auto/features/search/presentation/widgets/selector_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RentFilterScreen extends StatefulWidget {
  final List<RegionEntity>? regions;
  final MakeEntity? maker;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;

  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final RentBloc rentBloc;

  const RentFilterScreen({
    required this.rentBloc,
    this.regions,
    this.maker,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.yearValues,
    this.priceValues,
    Key? key,
  }) : super(key: key);

  @override
  State<RentFilterScreen> createState() => _RentFilterScreenState();
}

class _RentFilterScreenState extends State<RentFilterScreen> {
  late FilterBloc filterBloc;

  @override
  void initState() {
    final yearValues = RangeValues(
        widget.yearValues != null && widget.yearValues!.start > 0
            ? widget.yearValues!.start
            : 1970,
        widget.yearValues != null && widget.yearValues!.end > 0
            ? widget.yearValues!.end
            : DateTime.now().year + 0);
    final priceValues = widget.priceValues ?? const RangeValues(1000, 500000);
    filterBloc = FilterBloc(
      saleType: SaleType.all,
      currency: Currency.none,
      bodyType: widget.bodyType,
      carDriveType: widget.carDriveType,
      gearboxType: widget.gearboxType,
      maker: widget.maker,
      priceValues: priceValues,
      regions: widget.regions,
      yearValues: yearValues,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: filterBloc,
        child: BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) => Scaffold(
            appBar: WAppBar(
              boxShadow: const [],
              title: LocaleKeys.filter.tr(),
              centerTitle: false,
              extraActions: [
                WScaleAnimation(
                  onTap: () => filterBloc.add(FilterClearEvent()),
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
                )
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<List<RegionEntity>>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => RentChooseRegionBottomSheet(
                            checkedRegions: state.regions.asMap(),
                            list: context.read<RegionsBloc>().state.regions),
                      ).then((value) {
                        filterBloc.add(FilterSelectEvent(regions: value));
                      });
                    },
                    hintText: (state.regions.isEmpty)
                        ? LocaleKeys.choose_region.tr()
                        : state.regions.first.title,
                    title: LocaleKeys.region.tr(),
                    hasArrowDown: true,
                  ),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<MakeEntity>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => ChooseMaker(selectedMake: state.maker),
                      ).then((value) {
                        filterBloc.add(FilterSelectEvent(maker: value));
                      });
                    },
                    hintText: state.maker?.name ?? LocaleKeys.choose_brand.tr(),
                    title: LocaleKeys.brand.tr(),
                    hasArrowDown: true,
                  ),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<BodyTypeEntity>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => ChooseBodyType(
                            selectedId: state.bodyType?.id ?? -1),
                      ).then((value) {
                        filterBloc.add(FilterSelectEvent(bodyType: value));
                      });
                    },
                    hintText:
                        state.bodyType?.type ?? LocaleKeys.choose_body.tr(),
                    title: LocaleKeys.body_type.tr(),
                    hasArrowDown: true,
                  ),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<DriveTypeEntity>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => ChooseDriveType(
                            selectedId: state.driveType?.id ?? -1),
                      ).then((value) {
                        filterBloc.add(FilterSelectEvent(carDriveType: value));
                      });
                    },
                    hintText: state.driveType?.type ??
                        LocaleKeys.choose_drive_type.tr(),
                    title: LocaleKeys.drive_unit.tr(),
                    hasArrowDown: true,
                  ),
                  SelectorItem(
                    onTap: () async {
                      await showModalBottomSheet<GearboxTypeEntity>(
                        isDismissible: false,
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (c) => ChooseGearbox(
                            selectedId: state.gearboxType?.id ?? -1),
                      ).then((value) {
                        filterBloc.add(FilterSelectEvent(gearboxType: value));
                      });
                    },
                    hintText: state.gearboxType?.type ??
                        LocaleKeys.choose_box_type.tr(),
                    title: LocaleKeys.box.tr(),
                    hasArrowDown: true,
                  ),
                  const SizedBox(height: 16),
                  if (state.yearValues != null)
                    WRangeSlider(
                      values: state.yearValues!,
                      valueChanged: (value) =>
                          filterBloc.add(FilterSelectEvent(yearValues: value)),
                      title: LocaleKeys.year_of_issue.tr(),
                      endValue: DateTime.now().year + 0,
                      startValue: 1960,
                    ),
                  const SizedBox(height: 16),
                  if (state.priceValues != null)
                    WRangeSlider(
                      values: state.priceValues!,
                      valueChanged: (value) =>
                          filterBloc.add(FilterSelectEvent(priceValues: value)),
                      title: LocaleKeys.price.tr(),
                      endValue: 500000,
                      startValue: 1000,
                      isForPrice: true,
                    ),
                  const SizedBox(height: 48),
                  WButton(
                    onTap: () {
                      widget.rentBloc.add(
                        RentSetParamFromFilterEvent(
                          yearValues: state.yearValues,
                          priceValues: state.priceValues,
                          bodyType: state.bodyType,
                          carDriveType: state.driveType,
                          gearboxType: state.gearboxType,
                          maker: state.maker,
                          regions: state.regions,
                        ),
                      );
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
