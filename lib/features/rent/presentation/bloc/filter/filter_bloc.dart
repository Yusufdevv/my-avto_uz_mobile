import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/common/models/region.dart';
// import 'package:auto/features/profile/domain/entities/profile_data_entity.dart';
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

  final RangeValues? yearValues;
  final RangeValues? priceValues;
  FilterBloc({
    this.regions,
    this.maker,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.yearValues,
    this.priceValues,
  }) : super(FilterState(
          bodyType: bodyType,
          carDriveType: carDriveType,
          gearboxType: gearboxType,
          maker: maker,
          regions: regions,
          yearValues: yearValues ?? RangeValues(1960, DateTime.now().year + 0),
          priceValues: priceValues ?? const RangeValues(1000, 500000),
        )) {
    on<FilterClearEvent>((event, emit) => emit(FilterState(
          yearValues: RangeValues(1960, DateTime.now().year + 0),
          priceValues: const RangeValues(1000, 500000),
        )));
    on<FilterSelectEvent>((event, emit) {
      emit(state.copyWith(
        bodyType: event.bodyType,
        carDriveType: event.carDriveType,
        gearboxType: event.gearboxType,
        maker: event.maker,
        priceValues: event.priceValues,
        yearValues: event.yearValues,
        regions: event.regions,
      ));
    });
  }
}
