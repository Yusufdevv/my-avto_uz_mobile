import 'package:auto/features/ad/data/models/announcement_filter.dart';
import 'package:auto/features/ad/data/models/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ads/data/models/search_history_model.dart';
import 'package:auto/features/ads/domain/entities/search_history_entity.dart';
import 'package:auto/features/ads/domain/usecases/filter_history_usecase.dart';
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
  FilterHistoryUseCase filterHistoryUseCase;
  AnnouncementListBloc(
      {required this.useCase, required this.filterHistoryUseCase})
      : super(AnnouncementListState()) {
    on<_GetAnnouncementList>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(state.filter);
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
    on<_GetIsHistory>((event, emit) {
      emit(
        state.copyWith(
          isHistory: event.isHistory,
          searchModel: state.searchModel.copyWith(
            make: state.filter.make,
            model: [state.filter.model],
            queryData: state.searchModel.queryData!.copyWithout(
              bodyType: state.filter.bodyType,
              driveType: state.filter.driveType,
              gearboxType: state.filter.gearboxType,
              regionIn: state.filter.region__in,
              priceFrom: state.filter.priceFrom,
              priceTo: state.filter.priceTo,
              yearFrom: state.filter.yearFrom,
              yearTo: state.filter.yearTo,
              isNew: state.filter.isNew,
            ),
          ),
        ),
      );
    });
    on<_GetHistoryApi>((event, emit) async {
      await filterHistoryUseCase.call(state.searchModel);
    });
    on<_GetFilterClear>((event, emit) {
      if (event.ismake == true) {
        emit(
          state.copyWith(
            filter: state.filter.copyWith(
              make: -1,
              model: -1,
              gearboxType: null,
              bodyType: null,
              driveType: null,
              priceFrom: 1000,
              priceTo: 500000,
              yearFrom: 1960,
              yearTo: 2023,
            ),
          ),
        );
        add(AnnouncementListEvent.getAnnouncementList());
      } else {
        emit(
          state.copyWith(
            filter: state.filter.copyWith(
              gearboxType: null,
              bodyType: null,
              driveType: null,
              priceFrom: 1000,
              priceTo: 500000,
              yearFrom: 1960,
              yearTo: 2023,
            ),
          ),
        );
      }
    });
    on<_GetInfo>(
      (event, emit) => emit(
        state.copyWith(
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
        ),
      ),
    );
  }
}
