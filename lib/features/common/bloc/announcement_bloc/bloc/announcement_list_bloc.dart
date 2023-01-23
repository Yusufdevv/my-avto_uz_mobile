import 'package:auto/features/ad/data/models/announcement_filter.dart';
import 'package:auto/features/ad/data/models/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/usecases/announcement_list_usecase.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_list_event.dart';
part 'announcement_list_state.dart';
part 'announcement_list_bloc.freezed.dart';

class AnnouncementListBloc
    extends Bloc<AnnouncementListEvent, AnnouncementListState> {
  AnnouncementListUseCase useCase;
  AnnouncementListBloc({required this.useCase})
      : super(AnnouncementListState()) {
    on<_GetAnnouncementList>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(state.filter);
      print('===> ==> Buni qara ${state.filter}');
      if (result.isRight) {
        emit(
          state.copyWith(
            announcementList: result.right.results,
            status: FormzStatus.submissionSuccess,
            count: result.right.count,
            next: result.right.next ?? '',
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetFilter>(
      (event, emit) => emit(state.copyWith(filter: event.filter)),
    );
    on<_GetRegions>((event, emit) {
      emit(state.copyWith(
          filter: state.filter.copyWith(
              region__in:
                  event.regions.map((e) => '${e.id}').toList().join(','))));
      emit(state.copyWith(regions: event.regions));
    });
    on<_GetIsHistory>(
        (event, emit) => emit(state.copyWith(isHistory: event.isHistory)));
    on<_GetFilterClear>(
      (event, emit) => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            gearboxType: null,
            bodyType: null,
            driveType: null,
            priceFrom: 1000,
            priceTo: 500000,
            yearFrom: 1960,
            yearTo: 2023
          ),
        ),
      ),
    );
    on<_GetInfo>((event, emit) => emit(state.copyWith(
          bodyTypeEntity: event.bodyType,
          gearboxTypeEntity: event.gearboxType,
          driveTypeEntity: event.carDriveType,
          yearValues: event.yearValues == null
              ? const RangeValues(1960, 2023)
              : event.yearValues!,
          priceValues: event.priceValues == null
              ? const RangeValues(1000, 500000)
              : event.priceValues!,
          idVal: event.idVal ?? 0,
          isFilter: event.isFilter!,
        )));
  }
}
