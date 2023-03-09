// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ads/presentation/widgets/currency_box.dart';
import 'package:auto/features/ads/presentation/widgets/sale_type_buttons.dart';
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

  RangeValues yearRangeValues = RangeValues(1960, DateTime.now().year + 0);

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

  String tipSale = 'Прямая продажа';
  Currency currency = Currency.usd;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: filterBloc,
        child: BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) => Scaffold(
            backgroundColor: white,
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
                    LocaleKeys.clear.tr(),
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
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SaleTypeButtons(
                        onTap: (v) {
                          tipSale = v;
                          setState(() {});
                        },
                        selected: tipSale),
                    const SizedBox(height: 16),
                    CurrencyBox(
                      onTap: (v) {
                        currency = v;
                        setState(() {});
                      },
                      selected: currency,
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 20),
                    WRangeSlider(
                      values: yearRangeValues,
                      valueChanged: (value) {
                        log(':::::::::: on year slider changed:  ${value}  ::::::::::');
                        yearRangeValues = value;
                        setState(() {});
                      },
                      title: LocaleKeys.year_of_issue.tr(),
                      endValue: 2023,
                      startValue: 1960,
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
                    const SizedBox(height: 16),
                    WButton(
                      onTap: () {
                        var isFilter = (state.bodyType?.id != -1 &&
                                state.bodyType?.id != null) ||
                            (state.gearboxType?.id != -1 &&
                                state.gearboxType?.id != null) ||
                            (state.carDriveType?.id != -1 &&
                                state.carDriveType?.id != null) ||
                            state.yearValues.start != 0 ||
                            state.yearValues.end != 0 ||
                            state.priceValues.start != 0 ||
                            state.priceValues.end != 0 ||
                            state.currency != Currency.none;

                        ///
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
        ),
      );
}
