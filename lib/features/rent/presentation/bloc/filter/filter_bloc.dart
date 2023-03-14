import 'dart:developer';

import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ads/domain/usecases/get_min_max_price_use_case.dart';
import 'package:auto/features/ads/presentation/widgets/sale_type_buttons.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'filter_event.dart';

part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final List<RegionEntity>? regions;
  final MakeEntity? maker;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;
  final bool isCheckk;
  final bool isRentWithPurchase;
  final RangeValues yearValues;
  final RangeValues priceValues;
  final Currency currency;
  GetMinMaxPriceYearUseCase minMaxPriceYearUseCase =
      GetMinMaxPriceYearUseCase();

  FilterBloc({
    required this.currency,
    required this.yearValues,
    required this.priceValues,
    this.isRentWithPurchase = false,
    this.regions,
    this.maker,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.isCheckk = false,
  }) : super(
          FilterState(
            minYearValue: yearValues.start,
            maxYearValue: yearValues.end,
            minPriceValue: priceValues.start,
            maxPriceValue: priceValues.end,
            saleType: isRentWithPurchase
                ? SaleType.saleWithPurchase
                : SaleType.directSale,
            bodyType: bodyType?.id == -1 ? null : bodyType,
            carDriveType: carDriveType?.id == -1 ? null : carDriveType,
            gearboxType: gearboxType?.id == -1 ? null : gearboxType,
            maker: maker,
            regions: regions ?? <RegionEntity>[],
            yearValues: yearValues,
            priceValues: priceValues,
            currency: currency,
          ),
        ) {
    on<FilterClearEvent>((event, emit) {
      emit(FilterState(
        isRentWithPurchase: false,
        regions: const [],
        yearValues: yearValues,
        priceValues: priceValues,
        minYearValue: priceValues.start,
        maxPriceValue: priceValues.end,
        maxYearValue: yearValues.end,
        minPriceValue: yearValues.start,
        currency: Currency.usd,
        bodyType: null,
        carDriveType: null,
        gearboxType: null,
      ));
    });
    on<FilterSelectEvent>((event, emit) async {
      emit(state.copyWith(
        isRentWithPurchase: event.saleType == SaleType.saleWithPurchase,
        saleType: event.saleType,
        currency: event.currency,
        bodyType: event.bodyType,
        carDriveType: event.carDriveType,
        gearboxType: event.gearboxType,
        maker: event.maker,
        priceValues: event.priceValues,
        yearValues: event.yearValues,
        regions: event.regions,
      ));
    });
    on<FilterChangeCurrencyEvent>((event, emit) async {
      if (currency == Currency.none) return;
      final result = await minMaxPriceYearUseCase.call(event.currency.value);
      RangeValues? priceValues;
      RangeValues? yearValues;
      if (result.isRight) {
        priceValues = RangeValues(double.parse(result.right.minPrice),
            double.parse(result.right.maxPrice));
        yearValues = RangeValues(
            result.right.minYear.toDouble(), result.right.maxYear.toDouble());
      }

      emit(state.copyWith(
        priceValues: priceValues,
        minPriceValue: priceValues?.start,
        maxPriceValue: priceValues?.end,
        currency: event.currency,
        yearValues: yearValues,
        maxYearValue: yearValues?.end,
        minYearValue: yearValues?.start,
      ));
    });
  }
}
