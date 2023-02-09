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
  AnnouncementListUseCase useCase = AnnouncementListUseCase();
  FilterHistoryUseCase filterHistoryUseCase = FilterHistoryUseCase();

  AnnouncementListBloc() : super(AnnouncementListState()) {
    on<_GetAnnouncementList>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call({
        'make': state.filter.make,
        'model': state.filter.model,
        'body_type': state.filter.bodyType,
        'drive_type': state.filter.driveType,
        'gearbox_type': state.filter.gearboxType,
        'is_new': event.isNew,
        'region__in': state.filter.regionIn,
        'price_from': state.filter.priceFrom,
        'price_to': state.filter.priceTo,
        'year_from': state.filter.yearFrom,
        'year_to': state.filter.yearTo,
        'limit': 10,
        'offset': state.announcementList.length,
      });
      if (result.isRight) {
        emit(
          state.copyWith(
            announcementList: [
              ...state.announcementList,
              ...result.right.results
            ],
            status: FormzStatus.submissionSuccess,
            count: result.right.count,
            next: result.right.next != null,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetFilter>(
      (event, emit) {
        print('makeID: ${event.filter.make}');
        print('modelID: ${event.filter.model}');
        emit(state.copyWith(filter: event.filter));
      },
    );
    on<_GetRegions>((event, emit) {
      emit(state.copyWith(
          filter: state.filter.copyWith(
              regionIn:
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
              regionIn: state.filter.regionIn,
              priceFrom: state.filter.priceFrom,
              priceTo: state.filter.priceTo,
              yearFrom: state.filter.yearFrom,
              yearTo: state.filter.yearTo,
              isNew: event.isNew,
            ),
          ),
        ),
      );
    });
    on<_GetHistoryApi>((event, emit) async {
      await filterHistoryUseCase.call(state.searchModel);
    });
    on<_GetFilterClear>((event, emit) {
      emit(state.copyWith(filter: const AnnouncementFilterModel()));
      if (event.ismake == true) {
        add(AnnouncementListEvent.getAnnouncementList(null));
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
