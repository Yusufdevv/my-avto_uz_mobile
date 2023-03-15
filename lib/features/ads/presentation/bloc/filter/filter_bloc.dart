import 'dart:async';
import 'dart:developer';

import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ads/domain/entities/min_max_price_year_entity.dart';
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
    on<FilterClearEvent>(_clearFilter);
    on<FilterSelectEvent>(_select);
    on<FilterChangeCurrencyEvent>(_getCurrencies);
  }

  FutureOr<void> _getCurrencies(
      FilterChangeCurrencyEvent event, Emitter<FilterState> emit) async {
    RangeValues? priceV;
    RangeValues? yearV;
    MinMaxPriceYearEntity? usd;
    MinMaxPriceYearEntity? uzs;
    if (state.usdIfos == null || state.uzsIfos == null) {
      final resultUzs = await minMaxPriceYearUseCase.call(Currency.uzs.value);
      final resultUsd = await minMaxPriceYearUseCase.call(Currency.usd.value);
      log(':::::::::: RESULT USD INFOS: ${resultUsd.right}  ::::::::::');
      log(':::::::::: RESULT UZS INFOS: ${resultUzs.right}  ::::::::::');
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
      if (usd != null) {
        priceV = state.getPriceValues(usd);
        yearV = state.getYearValues(usd);
      }
    } else {
      if (uzs != null) {
        priceV = state.getPriceValues(uzs);
        yearV = state.getYearValues(uzs);
      }
    }

    emit(state.copyWith(
      usdIfos: usd,
      uzsIfos: uzs,
      priceValues: priceV,
      minPriceValue: priceV?.start,
      maxPriceValue: priceV?.end,
      currency: event.currency,
      yearValues: yearV,
      maxYearValue: yearV?.end,
      minYearValue: yearV?.start,
    ));
  }

  FutureOr<void> _select(
      FilterSelectEvent event, Emitter<FilterState> emit) async {
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
  }

  FutureOr<void> _clearFilter(
      FilterClearEvent event, Emitter<FilterState> emit) {
    final yearV = state.getYearValues(state.usdIfos);
    final priceV = state.getPriceValues(state.usdIfos);
    emit(
      FilterState(
        isRentWithPurchase: false,
        regions: const [],
        yearValues: yearV,
        priceValues: priceV,
        minYearValue: yearV.start,
        maxYearValue: yearValues.end,
        maxPriceValue: priceV.end,
        minPriceValue: priceV.start,
        currency: Currency.usd,
        bodyType: null,
        carDriveType: null,
        gearboxType: null,
      ),
    );
  }
}
