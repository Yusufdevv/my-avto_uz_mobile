import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ads/domain/usecases/get_min_max_price_use_case.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'filter_event.dart';

part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final List<Region>? regions;
  final MakeEntity? maker;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;
  final bool ischek;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  GetMinMaxPriceYearUseCase minMaxPriceYearUseCase =
      GetMinMaxPriceYearUseCase();

  FilterBloc({
    this.regions,
    this.maker,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.yearValues,
    this.priceValues,
    this.ischek = false,
  }) : super(FilterState(
          bodyType: bodyType,
          carDriveType: carDriveType,
          gearboxType: gearboxType,
          maker: maker,
          regions: regions ?? <Region>[],
          yearValues: yearValues ?? RangeValues(1960, DateTime.now().year + 0),
          priceValues: priceValues ?? const RangeValues(1000, 500000),
          ischeck: ischek,
        )) {
    on<FilterClearEvent>((event, emit) => emit(FilterState(
          ischeck: false,
          regions: const <Region>[],
          yearValues: RangeValues(1960, DateTime.now().year + 0),
          priceValues: const RangeValues(1000, 500000),
        )));
    on<FilterSelectEvent>((event, emit) async {
      final result = await minMaxPriceYearUseCase.call(state.currency.value);
      RangeValues? yearValues;
      RangeValues? priceValues;
      if (result.isRight) {
        yearValues = RangeValues(
            result.right.minYear.toDouble(), result.right.maxYear.toDouble());
        priceValues = RangeValues(double.parse(result.right.minPrice),
            double.parse(result.right.maxPrice));
      } else {
        priceValues = event.priceValues;
        yearValues = event.yearValues;
      }
      emit(state.copyWith(
        bodyType: event.bodyType,
        carDriveType: event.carDriveType,
        gearboxType: event.gearboxType,
        maker: event.maker,
        priceValues: priceValues,
        yearValues: yearValues,
        regions: event.regions,
        ischeck: true,
      ));
    });
  }
}
