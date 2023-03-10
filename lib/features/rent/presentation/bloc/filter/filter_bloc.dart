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
  final bool isCheck;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final Currency currency;
  GetMinMaxPriceYearUseCase minMaxPriceYearUseCase =
      GetMinMaxPriceYearUseCase();

  FilterBloc({
    required this.currency,
    this.regions,
    this.maker,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.yearValues,
    this.priceValues,
    this.isCheck = false,
  }) : super(FilterState(
          bodyType: bodyType?.id == -1 ? null : bodyType,
          carDriveType: carDriveType?.id == -1 ? null : carDriveType,
          gearboxType: gearboxType?.id == -1 ? null : gearboxType,
          maker: maker,
          regions: regions ?? <RegionEntity>[],
          yearValues: RangeValues(
              yearValues != null && yearValues.start > 0
                  ? yearValues.start
                  : 1960,
              yearValues != null && yearValues.end > 0
                  ? yearValues.end
                  : DateTime.now().year + 0),
          priceValues: priceValues ?? const RangeValues(1000, 500000),
          isCheck: isCheck,
          currency: currency,
          priceStart: priceValues?.start,
          priceEnd: priceValues?.end,
        )) {
    on<FilterClearEvent>((event, emit) => emit(FilterState(
          isCheck: false,
          regions: const [],
          yearValues:
              event.yearValues ?? RangeValues(1960, DateTime.now().year + 0),
          priceValues: event.priceValues ?? const RangeValues(1000, 500000),
          priceStart: priceValues?.start,
          priceEnd: priceValues?.end,
          currency: Currency.none,
          bodyType: null,
          carDriveType: null,
          gearboxType: null,
        )));
    on<FilterSelectEvent>((event, emit) async {
      log(':::::::::: FilterSelectEvent  triggered: ${event.saleType}  ::::::::::');
      emit(state.copyWith(
        saleType: event.saleType,
        currency: event.currency,
        bodyType: event.bodyType,
        carDriveType: event.carDriveType,
        gearboxType: event.gearboxType,
        maker: event.maker,
        priceValues: event.priceValues,
        yearValues: event.yearValues,
        regions: event.regions,
        isCheck: true,
      ));
    });
    on<FilterChangeCurrencyEvent>((event, emit) async {
      final result = await minMaxPriceYearUseCase.call(event.currency.value);
      RangeValues? priceValues;
      RangeValues? yearValues;
      if (result.isRight) {
        priceValues = RangeValues(double.parse(result.right.minPrice),
            double.parse(result.right.maxPrice));
        log(':::::::::: maxYearf: ${result.right.maxYear}  ::::::::::');
        log(':::::::::: minYearf: ${result.right.minYear}  ::::::::::');
        yearValues = RangeValues(
            result.right.minYear.toDouble(), result.right.maxYear.toDouble());
      }
      emit(state.copyWith(
        priceValues: priceValues,
        priceStart: priceValues?.start,
        priceEnd: priceValues?.end,
        currency: event.currency,
        yearValues: yearValues,
        yearEnd: yearValues?.end,
        yearStart: yearValues?.start,
      ));
    });
  }
}
