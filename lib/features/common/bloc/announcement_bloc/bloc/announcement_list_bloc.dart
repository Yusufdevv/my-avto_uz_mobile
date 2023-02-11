import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ads/data/models/search_history_model.dart';
import 'package:auto/features/ads/domain/entities/search_history_entity.dart';
import 'package:auto/features/ads/domain/usecases/filter_history_usecase.dart';
import 'package:auto/features/ads/domain/usecases/get_min_max_price_use_case.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/usecases/announcement_list_usecase.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'announcement_list_event.dart';

part 'announcement_list_state.dart';

class AnnouncementListBloc
    extends Bloc<AnnouncementListEvent, AnnouncementListState> {
  AnnouncementListUseCase useCase = AnnouncementListUseCase();
  FilterHistoryUseCase filterHistoryUseCase = FilterHistoryUseCase();
  GetMinMaxPriceYearUseCase minMaxPriceYearUseCase =
      GetMinMaxPriceYearUseCase();

  AnnouncementListBloc() : super(const AnnouncementListState()) {
    on<GetAnnouncementList>((event, emit) async {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
        isNew: event.isNew,
      ));
      final result = await useCase.call({
        'make': state.makeId,
        'model': state.modelId,
        'body_type': state.bodyType,
        'drive_type': state.driveType,
        'gearbox_type': state.gearboxType,
        'is_new': event.isNew,
        'region__in': getRegionsId(state.regions),
        'price_from': state.priceValues?.start,
        'price_to': state.priceValues?.end,
        'year_from': state.yearValues?.start,
        'year_to': state.yearValues?.end,
        'limit': 10,
        'offset': 0,
      });
      if (result.isRight) {
        emit(
          state.copyWith(
            announcementList: result.right.results,
            status: FormzStatus.submissionSuccess,
            count: result.right.count,
            next: result.right.next != null,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<GetMoreAnnouncementList>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call({
        'make': state.makeId,
        'model': state.modelId,
        'body_type': state.bodyType,
        'drive_type': state.driveType,
        'gearbox_type': state.gearboxType,
        'is_new': event.isNew,
        'region__in': getRegionsId(state.regions),
        'price_from': state.priceValues?.start,
        'price_to': state.priceValues?.end,
        'year_from': state.yearValues?.start,
        'year_to': state.yearValues?.end,
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
    on<GetMinMaxPriceYear>((event, emit) async {
      final result = await minMaxPriceYearUseCase.call(state.currency.value);
      if (result.isRight) {
        emit(
          state.copyWith(
            yearValues: RangeValues(result.right.minYear.toDouble(),
                result.right.maxYear.toDouble()),
            priceValues: RangeValues(double.parse(result.right.minPrice),
                double.parse(result.right.maxPrice)),
          ),
        );
      }
    });
    on<SetFilter>((event, emit) {
      if (state.currency != event.currency) {
        add(const GetMinMaxPriceYear());
      }
      emit(state.copyWith(
        makeId: event.makeId,
        modelId: event.modelId,
        currency: event.currency ?? state.currency,
        gearboxType: event.gearboxType,
        bodyType: event.bodyType,
        driveType: event.driveType,
        yearValues: event.yearValues,
        priceValues: event.priceValues,
        isFilter: event.isFilter,
      ));
      add(GetAnnouncementList(isNew: event.isNew));
    });
    on<ClearFilter>((event, emit) {
      if (state.currency != Currency.usd) {
        add(const GetMinMaxPriceYear());
      }
      emit(state.copyWith(
        currency: Currency.usd,
        gearboxType: null,
        bodyType: null,
        driveType: null,
        isFilter: false,
      ));
      add(GetAnnouncementList(isNew: event.isNew));
    });
    on<SetRegions>((event, emit) {
      emit(state.copyWith(regions: event.regions));
      add(GetAnnouncementList(isNew: event.isNew));
    });
  }

  String getRegionsId(List<Region> list) {
    final ids = StringBuffer();
    for (final value in list) {
      ids.write('${value.id},');
    }
    return ids.toString();
  }
}
