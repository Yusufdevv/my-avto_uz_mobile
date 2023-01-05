import 'dart:async';

import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';
import 'package:auto/features/rent/domain/usecases/rent_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
part 'rent_event.dart';
part 'rent_state.dart';

class RentBloc extends Bloc<RentEvent, RentState> {
  final RentUseCase rentUseCase;

  RentBloc({required this.rentUseCase, required int id})
      : super(RentState(
          carBodyTypeId: '',
          carDriveTypeId: '',
          gearboxTypeId: '',
          categoryId: id,
          count: 5,
          hasAirConditioners: 0,
          hasBabySeat: 0,
          list: const [],
          next: '',
          paginationStatus: FormzStatus.pure,
          rentCarIsClean: 0,
          rentCarIsFullFuel: 0,
          status: FormzStatus.pure,
        )) {
    on<RentGetResultsEvent>(_get);
    on<RentGetMoreEvent>(_getMore);
    on<RentSetIdEvent>(_setId);
    on<RentSetParamFromFilterEvent>(_setFromFilter);
    on<RentCleanFilterEvent>(_clearFilter);
  }
  FutureOr<void> _setFromFilter(
      RentSetParamFromFilterEvent event, Emitter<RentState> emit) async {
    emit(
      state.copyWith(
        regions: event.regions,
        carMakers: event.carMakerId,
        carBodyTypeId: event.carBodyTypeId,
        carDriveTypeId: event.carDriveTypeId,
        gearboxTypeId: event.gearboxTypeId,
        yearEnd: event.yearEnd,
        yearStart: event.yearStart,
        priceEnd: event.priceEnd,
        priceStart: event.priceStart,
      ),
    );
  }

  FutureOr<void> _clearFilter(
      RentCleanFilterEvent event, Emitter<RentState> emit) async {
    emit(
      state.copyWith(
        regions: [],
        carMakers: '',
        carBodyTypeId: '',
        carDriveTypeId: '',
        gearboxTypeId: '',
      ),
    );
  }

  FutureOr<void> _get(
      RentGetResultsEvent event, Emitter<RentState> emit) async {
    if (!(event.isRefresh ?? false)) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
    }
    final result = await rentUseCase(
      Param(
        next: '',
        id: state.categoryId,
        hasAirConditioner: state.hasAirConditioners,
        hasBabySeat: state.hasBabySeat,
        rentCarIsClean: state.rentCarIsClean,
        rentCarIsFullFuel: state.rentCarIsFullFuel,
        carBodyTypeId: state.carBodyTypeId,
        carDriveTypeId: state.carDriveTypeId,
        gearboxTypeId: state.gearboxTypeId,
        makers: state.carMakers,
        regions: state.regions?.map((e) => e.id.toString()).toList().join(','),
        rentPriceEnd: state.priceEnd,
        rentPriceStatart: state.priceStart,
        yearEnd: state.yearEnd,
        yearStatart: state.yearStart,
      ),
    );
    if (result.isRight) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          list: result.right.results,
          count: result.right.count,
          next: result.right.next,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _getMore(
      RentGetMoreEvent event, Emitter<RentState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result =
        await rentUseCase(Param(next: state.next!, id: state.categoryId));
    if (result.isRight) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          list: [...state.list, ...result.right.results],
          count: result.right.count,
          next: result.right.next,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _setId(RentSetIdEvent event, Emitter<RentState> emit) async {
    emit(state.copyWith(
      categoryId: event.categoryId,
      hasBabySeat: event.hasBabySeat ?? state.hasBabySeat,
      hasAirConditioners: event.hasAirConditioner ?? state.hasAirConditioners,
      rentCarIsFullFuel: event.rentCarIsFullFuel ?? state.rentCarIsFullFuel,
      rentCarIsClean: event.rentCarIsClean ?? state.rentCarIsClean,
    ));
    add(RentGetResultsEvent(isRefresh: true));
  }

  static Map<String, dynamic> mapper(Param params) {
    final map = <String, dynamic>{};
    if (params.hasAirConditioner != null && params.hasAirConditioner! > 0) {
      map['rent_car__has_air_conditioner'] = params.hasAirConditioner;
    }
    if (params.hasBabySeat != null && params.hasBabySeat! > 0) {
      map['rent_car__has_baby_seat'] = params.hasBabySeat;
    }
    if (params.rentCarIsClean != null && params.rentCarIsClean! > 0) {
      map['rent_car__is_clean'] = params.rentCarIsClean;
    }
    if (params.rentCarIsFullFuel != null && params.rentCarIsFullFuel! > 0) {
      map['rent_car__is_full_fuel'] = params.rentCarIsFullFuel;
    }
    if (params.regions != null && params.regions!.isNotEmpty) {
      map['region__in'] = params.regions;
    }
    if (params.makers != null && params.makers!.isNotEmpty) {
      map['rent_car__make'] = params.makers;
    }
    if (params.carBodyTypeId != null && params.carBodyTypeId!.isNotEmpty) {
      map['rent_car__body_type'] = params.carBodyTypeId;
    }
    if (params.carDriveTypeId != null && params.carDriveTypeId!.isNotEmpty) {
      map['rent_car__drive_type'] = params.carDriveTypeId;
    }
    if (params.gearboxTypeId != null && params.gearboxTypeId!.isNotEmpty) {
      map['rent_car__gearbox_type'] = params.gearboxTypeId;
    }
    /////////////////////////////////////////////////////////////////////
    if (params.rentPriceStatart != null && params.rentPriceStatart! > 0) {
      map['rent_price_start'] = params.rentPriceStatart;
    }
    if (params.rentPriceEnd != null && params.rentPriceEnd! > 0) {
      map['rent_price_end'] = params.rentPriceEnd;
    }
    if (params.yearStatart != null && params.yearStatart!.isNotEmpty) {
      map['rent_car_year_start'] = params.yearStatart;
    }
    if (params.yearEnd != null && params.yearEnd!.isNotEmpty) {
      map['rent_car_year_end'] = params.yearEnd;
    }
    print('returning map is: $map');

    return map;
  }
}
