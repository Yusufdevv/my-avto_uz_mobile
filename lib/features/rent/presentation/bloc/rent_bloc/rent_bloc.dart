import 'dart:async';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';
import 'package:auto/features/rent/domain/usecases/rent_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
part 'rent_event.dart';
part 'rent_state.dart';

class RentBloc extends Bloc<RentEvent, RentState> {
  final RentUseCase rentUseCase;

  RentBloc({required this.rentUseCase, required int id})
      : super(RentState(
          regions: const <RegionEntity>[],
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
  }
  FutureOr<void> _setFromFilter(
      RentSetParamFromFilterEvent event, Emitter<RentState> emit) async {
    emit(
      RentState(
        categoryId: state.categoryId,
        count: state.count,
        hasAirConditioners: state.hasAirConditioners,
        hasBabySeat: state.hasBabySeat,
        list: state.list,
        next: state.next,
        paginationStatus: state.paginationStatus,
        rentCarIsClean: state.rentCarIsClean,
        rentCarIsFullFuel: state.rentCarIsFullFuel,
        status: state.status,
        gearboxType: event.gearboxType,
        regions: event.regions ?? [],
        maker: event.maker,
        bodyType: event.bodyType,
        carDriveType: event.carDriveType,
        yearValues: event.yearValues,
        priceValues: event.priceValues,
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
        carBodyTypeId: state.bodyType == null ? null : '${state.bodyType!.id}',
        carDriveTypeId:
            state.carDriveType == null ? null : '${state.carDriveType!.id}',
        gearboxTypeId:
            state.gearboxType == null ? null : '${state.gearboxType!.id}',
        maker: state.maker == null ? null : '${state.maker!.id}',
        regions: state.regions.map((e) => e.id.toString()).toList().join(','),
        rentPriceEnd: state.priceValues?.end.floor(),
        rentPriceStart: state.priceValues?.start.floor(),
        yearEnd: state.yearValues?.end.floor().toString(),
        yearStart: state.yearValues?.start.floor().toString(),
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
}
