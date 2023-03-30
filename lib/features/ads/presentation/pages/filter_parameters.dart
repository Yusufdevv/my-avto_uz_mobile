// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ads/presentation/bloc/filter/filter_bloc.dart';
import 'package:auto/features/ads/presentation/widgets/currency_box.dart';
import 'package:auto/features/common/widgets/range_slider.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_body_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_drive_type.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_gearbox.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/choose_sale_type_sheet.dart';
import 'package:auto/features/search/presentation/widgets/selector_item.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SaleType {
  all(LocaleKeys.all, ''),
  directSale(LocaleKeys.direct_sale, 'false'),
  rentWithPurchase(LocaleKeys.rent_to_sale, 'true');

  const SaleType(this.title, this.toApi);

  final String toApi;
  final String title;
}

extension SaleTypeExtention on SaleType {
  bool get isAll => this == SaleType.all;
}

class FilterParameters extends StatefulWidget {
  /////////////////////////////
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;
  final Currency currency;
  final RangeValues? yearValues;
  final RangeValues? priceValues;

  final SaleType saleType;

  const FilterParameters({
    required this.currency,
    required this.saleType,
    super.key,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.yearValues,
    this.priceValues,
  });

  @override
  State<FilterParameters> createState() => _FilterParametersState();
}

class _FilterParametersState extends State<FilterParameters> {
  late FilterBloc filterBloc;

  @override
  void initState() {
    super.initState();
    final isYearValuesIsNull = widget.yearValues == null;
    final isPriceValuesIsNull = widget.priceValues == null;

    final currency =
        widget.currency == Currency.none ? Currency.usd : widget.currency;
    filterBloc = FilterBloc(
      saleType: widget.saleType,
      bodyType: widget.bodyType,
      carDriveType: widget.carDriveType,
      gearboxType: widget.gearboxType,
      priceValues: widget.priceValues,
      yearValues: widget.yearValues,
      currency: currency,
    )..add(
        FilterGetCurrencies(
          currency: currency,
          yearValuesIsNull: widget.yearValues == null,
          priceValuesIsNull: widget.priceValues == null,
        ),
      );
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: filterBloc,
        child: BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) => Scaffold(
            backgroundColor:
                Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
            appBar: WAppBar(
              title: LocaleKeys.options.tr(),
              centerTitle: false,
              extraActions: [
                WButton(
                  disabledColor: Colors.transparent,
                  isDisabled: !state.isFilter,
                  color: Colors.transparent,
                  onTap: () {
                    filterBloc.add(
                      const FilterClearEvent(),
                    );
                  },
                  child: Text(
                    LocaleKeys.reset.tr(),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: orange,
                          // state.isFilter ? orange : null,
                        ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CurrencyBox(
                      onTap: (v) {
                        filterBloc.add(FilterGetCurrencies(currency: v));
                      },
                      selected: state.currency,
                    ),
                    const SizedBox(height: 16),
                    SelectorItem(
                      onTap: () async {
                        await showModalBottomSheet<SaleType>(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) =>
                              ChooseSaleTypeSheet(selected: state.saleType),
                        ).then(
                          (value) {
                            filterBloc.add(
                              FilterSelectEvent(
                                saleType: value ?? SaleType.all,
                              ),
                            );
                          },
                        );
                      },
                      hintText: state.saleType.isAll
                          ? LocaleKeys.all.tr()
                          : state.saleType.title,
                      title: LocaleKeys.sale_type.tr(),
                      hasArrowDown: state.saleType.isAll,
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
                          filterBloc.add(FilterSelectEvent(
                              bodyType: value ?? const BodyTypeEntity()));
                        });
                      },
                      hintText: state.bodyType?.type ?? LocaleKeys.all.tr(),
                      title: LocaleKeys.body_type.tr(),
                      hasArrowDown: state.bodyType == null ||
                          (state.bodyType?.type.isEmpty ?? true),
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
                          ).then(
                            (value) {
                              filterBloc.add(
                                FilterSelectEvent(
                                  carDriveType:
                                      value ?? const DriveTypeEntity(),
                                ),
                              );
                            },
                          );
                        },
                        hintText: state.driveType?.type ?? LocaleKeys.all.tr(),
                        title: LocaleKeys.drive_unit.tr(),
                        hasArrowDown: state.driveType?.type == null
                            ? true
                            : state.driveType!.type.isEmpty),
                    SelectorItem(
                      onTap: () async {
                        await showModalBottomSheet<GearboxTypeEntity>(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (c) => ChooseGearbox(
                              selectedId: state.gearboxType?.id ?? -1),
                        ).then(
                          (value) {
                            filterBloc.add(
                              FilterSelectEvent(
                                gearboxType: value ?? const GearboxTypeEntity(),
                              ),
                            );
                          },
                        );
                      },
                      hintText: state.gearboxType?.type ?? LocaleKeys.all.tr(),
                      title: LocaleKeys.box.tr(),
                      hasArrowDown: state.gearboxType?.type == null
                          ? true
                          : state.gearboxType!.type.isEmpty,
                    ),
                    const SizedBox(height: 20),
                    if (state.minYearValue != null &&
                        state.maxYearValue != null &&
                        state.yearValues != null)
                      WRangeSlider(
                        values: state.yearValues!,
                        valueChanged: (value) {
                          filterBloc.add(FilterSelectEvent(yearValues: value));
                        },
                        title: LocaleKeys.year_of_issue.tr(),
                        endValue: state.maxYearValue!,
                        startValue: state.minYearValue!,
                      ),
                    const SizedBox(height: 16),
                    if (state.maxPriceValue != null &&
                        state.minPriceValue != null &&
                        state.priceValues != null)
                      WRangeSlider(
                        values: state.priceValues!,
                        valueChanged: (value) {
                          filterBloc.add(
                            FilterSelectEvent(priceValues: value),
                          );
                        },
                        title: LocaleKeys.price.tr(),
                        endValue: state.maxPriceValue!,
                        startValue: state.minPriceValue!,
                        isForPrice: true,
                        description: state.currency == Currency.uzs
                            ? LocaleKeys.sum.tr()
                            : 'у.е.',
                      ),
                    const SizedBox(height: 16),
                    WButton(
                      onTap: () {
                        Navigator.of(context).pop(state);
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
