import 'dart:async';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ads/domain/entities/min_max_price_year_entity.dart';
import 'package:auto/features/ads/domain/usecases/get_min_max_price_use_case.dart';
import 'package:auto/features/ads/presentation/pages/filter_parameters.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

part 'filter_event.dart';

part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final List<RegionEntity>? regions;
  final MakeEntity? maker;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;
  final bool isCheckk;
  final SaleType saleType;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final Currency currency;
  GetMinMaxPriceYearUseCase minMaxPriceYearUseCase =
      GetMinMaxPriceYearUseCase();

  FilterBloc({
    required this.currency,
    required this.saleType,
    this.yearValues,
    this.priceValues,
    this.regions,
    this.maker,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.isCheckk = false,
  }) : super(
          FilterState(
            minYearValue: yearValues?.start,
            maxYearValue: yearValues?.end,
            minPriceValue: priceValues?.start,
            maxPriceValue: priceValues?.end,
            saleType: saleType,
            bodyType: bodyType?.id == -1 ? null : bodyType,
            driveType: carDriveType?.id == -1 ? null : carDriveType,
            gearboxType: gearboxType?.id == -1 ? null : gearboxType,
            maker: maker,
            regions: regions ?? <RegionEntity>[],
            yearValues: yearValues,
            priceValues: priceValues,
            currency: currency,
          ),
        ) {
    on<FilterClearEvent>(_clearFilter);
    on<FilterSelectEvent>(_select);
    on<FilterGetCurrencies>(_getCurrencies);
  }

  FutureOr<void> _getCurrencies(
      FilterGetCurrencies event, Emitter<FilterState> emit) async {
    RangeValues? priceV;
    RangeValues? yearV;
    MinMaxPriceYearEntity? usd;
    MinMaxPriceYearEntity? uzs;

    if (state.usdIfos == null ||
        state.uzsIfos == null ||
        event.currency != state.currency) {
      final resultUzs = await minMaxPriceYearUseCase.call(Currency.uzs.value);
      final resultUsd = await minMaxPriceYearUseCase.call(Currency.usd.value);
      if (resultUsd.isRight) {
        usd = resultUsd.right;
      }
      if (resultUzs.isRight) {
        uzs = resultUzs.right;
      }
    } else {
      uzs = state.uzsIfos;
      usd = state.usdIfos;
    }

    if (event.currency == Currency.usd) {
      priceV = state.getPriceValues(usd);
      yearV = state.getYearValues(usd);
    } else {
      priceV = state.getPriceValues(uzs);
      yearV = state.getYearValues(uzs);
    }

    emit(state.copyWith(
      isFilterCleared: event.yearValuesIsNull,
      usdIfos: usd,
      uzsIfos: uzs,
      currency: event.currency,
      minPriceValue: priceV.start,
      maxPriceValue: priceV.end,
      maxYearValue: yearV.end,
      minYearValue: yearV.start,
      priceValues: event.priceValuesIsNull ? priceV : null,
      yearValues: event.yearValuesIsNull ? yearV : null,
    ));
  }

  FutureOr<void> _select(
      FilterSelectEvent event, Emitter<FilterState> emit) async {
    emit(state.copyWith(
      isFilterCleared: false,
      isRentWithPurchase: event.saleType == SaleType.rentWithPurchase,
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
  }

  FutureOr<void> _clearFilter(
      FilterClearEvent event, Emitter<FilterState> emit) {
    final yearV = state.getYearValues(state.usdIfos);
    final priceV = state.getPriceValues(state.usdIfos);
   emit(
      FilterState(
        uzsIfos: state.uzsIfos,
        usdIfos: state.usdIfos,
        minPriceValue: priceV.start,
        maxPriceValue: priceV.end,
        minYearValue: yearV.start,
        maxYearValue: yearV.end,
        saleType: SaleType.all,
        isRentWithPurchase: false,
        regions: const [],
        yearValues: yearV,
        priceValues: priceV,
        currency: Currency.usd,
        bodyType: null,
        driveType: null,
        gearboxType: null,
      ),
    );
  }
}
