// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/common/widgets/range_slider.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/rent/presentation/bloc/filter/filter_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_body_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_drive_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_gearbox.dart';
import 'package:auto/features/search/presentation/widgets/selector_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterParameters extends StatefulWidget {
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;
  final Currency? currency;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final bool? isCheck;

  const FilterParameters({
    super.key,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.yearValues,
    this.priceValues,
    this.currency,
    this.isCheck,
  });

  @override
  State<FilterParameters> createState() => _FilterParametersState();
}

class _FilterParametersState extends State<FilterParameters> {
  late FilterBloc filterBloc;

  @override
  void initState() {
    super.initState();
    filterBloc = FilterBloc(
      bodyType: widget.bodyType,
      carDriveType: widget.carDriveType,
      gearboxType: widget.gearboxType,
      priceValues: widget.priceValues,
      yearValues: widget.yearValues,
      isCheck: widget.isCheck ?? false,
      currency: widget.currency,
    );
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: filterBloc,
        child: BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) => Scaffold(
            appBar: WAppBar(
              title: LocaleKeys.options.tr(),
              centerTitle: false,
              extraActions: [
                TextButton(
                  onPressed: () {
                    filterBloc.add(FilterClearEvent(
                      yearValues: widget.yearValues,
                      priceValues: widget.priceValues,
                    ));
                  },
                  child: Text(
                    LocaleKeys.reset.tr(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: orange,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    hintText: state.bodyType?.type == null
                        ? LocaleKeys.choose_body.tr()
                        : state.bodyType!.type.isEmpty
                            ? LocaleKeys.choose_body.tr()
                            : state.bodyType!.type,
                    title: LocaleKeys.body_type.tr(),
                    hasArrowDown: state.bodyType?.type == null
                        ? true
                        : state.bodyType!.type.isEmpty,
                  ),
                  SelectorItem(
                      onTap: () async {
                        await showModalBottomSheet<DriveTypeEntity>(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) => ChooseDriveType(
                              selectedId: state.carDriveType?.id ?? -1),
                        ).then((value) {
                          filterBloc
                              .add(FilterSelectEvent(carDriveType: value));
                        });
                      },
                      hintText: state.carDriveType?.type == null
                          ? LocaleKeys.choose_drive_type.tr()
                          : state.carDriveType!.type.isEmpty
                              ? LocaleKeys.choose_drive_type.tr()
                              : state.carDriveType!.type,
                      title: LocaleKeys.drive_unit.tr(),
                      hasArrowDown: state.carDriveType?.type == null
                          ? true
                          : state.carDriveType!.type.isEmpty),
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
                        filterBloc.add(FilterSelectEvent(
                          gearboxType: value,
                        ));
                      });
                    },
                    hintText: state.gearboxType?.type == null
                        ? LocaleKeys.choose_box_type.tr()
                        : state.gearboxType!.type.isEmpty
                            ? LocaleKeys.choose_box_type.tr()
                            : state.gearboxType!.type,
                    title: LocaleKeys.box.tr(),
                    hasArrowDown: state.gearboxType?.type == null
                        ? true
                        : state.gearboxType!.type.isEmpty,
                  ),
                  Text(
                    LocaleKeys.select_currency.tr(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WButton(
                        onTap: () {
                          filterBloc.add(
                              const FilterChangeCurrencyEvent(Currency.usd));
                        },
                        height: 36,
                        width: MediaQuery.of(context).size.width * 0.45,
                        color: state.currency == Currency.usd
                            ? lavender
                            : whiteSmoke,
                        borderRadius: 46,
                        border: state.currency == Currency.usd
                            ? Border.all(color: purple)
                            : null,
                        child: Text(
                          'у.е.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: state.currency == Currency.usd ? dark : grey,
                          ),
                        ),
                      ),
                      WButton(
                        onTap: () {
                          filterBloc.add(
                              const FilterChangeCurrencyEvent(Currency.uzs));
                        },
                        height: 36,
                        width: MediaQuery.of(context).size.width * 0.45,
                        color: state.currency == Currency.uzs
                            ? lavender
                            : whiteSmoke,
                        borderRadius: 46,
                        border: state.currency == Currency.uzs
                            ? Border.all(color: purple)
                            : null,
                        child: Text(
                          LocaleKeys.sum.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: state.currency == Currency.uzs ? dark : grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  WRangeSlider(
                    values: state.yearValues,
                    valueChanged: (value) => filterBloc.add(FilterSelectEvent(
                      yearValues: value,
                    )),
                    title: LocaleKeys.year_of_issue.tr(),
                    endValue: widget.yearValues?.end ?? DateTime.now().year + 0,
                    startValue: widget.yearValues?.start ?? 1960,
                  ),
                  const SizedBox(height: 16),
                  WRangeSlider(
                    values: state.priceValues,
                    valueChanged: (value) => filterBloc.add(FilterSelectEvent(
                      priceValues: value,
                    )),
                    title: LocaleKeys.price.tr(),
                    endValue: state.priceEnd ?? 0,
                    startValue: state.priceStart ?? 1,
                    isForPrice: true,
                    description: state.currency == Currency.uzs
                        ? LocaleKeys.sum.tr()
                        : 'у.е.',
                  ),
                  const Spacer(),
                  WButton(
                    onTap: () {
                      var isFilter = state.bodyType != widget.bodyType ||
                          state.gearboxType != widget.gearboxType;
                      isFilter = state.carDriveType != widget.carDriveType ||
                          state.yearValues != widget.yearValues;
                      isFilter = state.currency != widget.currency ||
                          state.isCheck != widget.isCheck;
                      log('======= $isFilter');
                      Navigator.of(context).pop({
                        'bodyType': state.bodyType,
                        'gearboxType': state.gearboxType,
                        'carDriveType': state.carDriveType,
                        'yearValues': state.yearValues,
                        'priceValues': state.priceValues,
                        'currency': state.currency,
                        'isFilter': isFilter,
                      });
                    },
                    text: LocaleKeys.show.tr(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
