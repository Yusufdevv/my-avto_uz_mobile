import 'dart:async';
import 'dart:developer';

import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ads/data/models/query_data_model.dart';
import 'package:auto/features/ads/data/models/save_filter_model.dart';
import 'package:auto/features/ads/domain/usecases/get_announcement_list_usecase.dart';
import 'package:auto/features/ads/domain/usecases/get_min_max_price_use_case.dart';
import 'package:auto/features/ads/domain/usecases/save_filter_history_usecase.dart';
import 'package:auto/features/ads/presentation/pages/filter_parameters.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'announcement_list_event.dart';

part 'announcement_list_state.dart';

class AnnouncementListBloc
    extends Bloc<AnnouncementListEvent, AnnouncementListState> {
  GetAnnouncementListUseCase useCase = GetAnnouncementListUseCase();
  SaveFilterHistoryUseCase saveFilterHistoryUseCase =
      SaveFilterHistoryUseCase();
  GetMinMaxPriceYearUseCase minMaxPriceYearUseCase =
      GetMinMaxPriceYearUseCase();

  AnnouncementListBloc() : super(const AnnouncementListState()) {
    on<GetAnnouncementList>(_getAnnouncementList);
    on<GetMoreAnnouncementList>(_getMoreAnnouncementList);
    on<SetFilter>(_setFilter);
    on<SetMakeModel>(_setMakeModel);
    on<ClearFilter>(_clearFilter);
    on<SetRegions>(_setRegions);
    on<SetSort>(_setSort);
    on<ChangeSaveFilterStatus>(_changeSaveFilterStatus);
    on<SaveHistory>(_saveHistory);
    on<ChangeAppBarEvent>(_changeAppBar);
  }

  FutureOr<void> _getMoreAnnouncementList(GetMoreAnnouncementList event,
      Emitter<AnnouncementListState> emit) async {
    final result = await useCase.call({
      'make': state.make?.id == -1 ? '' : state.make?.id,
      'model': state.modelId == -1 ? '' : state.modelId,
      'body_type': state.bodyType?.id == -1 ? '' : state.bodyType?.id,
      'drive_type': state.driveType?.id == -1 ? '' : state.driveType?.id,
      'gearbox_type': state.gearboxType?.id == -1 ? '' : state.gearboxType?.id,
      'is_new': state.isNeww,
      'region__in': getRegionsId(state.regions),
      'price_from': state.priceValuess?.start == -1
          ? ''
          : state.priceValuess?.start == 0.0
              ? ''
              : state.priceValuess?.start,
      'price_to': state.priceValuess?.end == -1
          ? ''
          : state.priceValuess?.end == 0.0
              ? ''
              : state.priceValuess?.end,
      'year_from': state.yearValuess?.start == -1
          ? ''
          : state.yearValuess?.start == 0.0
              ? ''
              : state.yearValuess?.start,
      'year_to': state.yearValuess?.end == -1
          ? ''
          : state.yearValuess?.end == 0.0
              ? ''
              : state.yearValuess?.end,
      'is_rent_with_purchase': state.saleType.toApi,
      'limit': 10,
      'offset': state.announcementList.length,
      'currency': state.currency?.value,
      'ordering': state.sortStatus?.value,
    });
    if (result.isRight) {
      emit(
        state.copyWith(
          announcementList: [
            ...state.announcementList,
            ...result.right.results
          ],
          count: result.right.count,
          next: result.right.next != null,
        ),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _setFilter(
      SetFilter event, Emitter<AnnouncementListState> emit) async {
    log(':::::::::: IS RENT  WITH PURCHASE IN SET FILTER: ${event.saleType}  ::::::::::');
    emit(state.copyWith(
      saleType: event.saleType,
      currency: event.currency,
      gearboxType: event.gearboxType,
      bodyType: event.bodyType,
      driveType: event.driveType,
      yearValuess: event.yearValues,
      priceValuess: event.priceValues,
      isFilter: event.isFilter,
      historyId: event.historyId ?? state.historyId,
      historySaved: event.historySaved,
    ));

    add(const GetAnnouncementList());
  }

  FutureOr<void> _setMakeModel(
      SetMakeModel event, Emitter<AnnouncementListState> emit) async {
    emit(state.copyWith(
      modelId: event.modelId,
      modelName: event.modelName,
      make: event.make,
      historySaved: event.historySaved,
    ));
    add(const GetAnnouncementList());
  }

  FutureOr<void> _clearFilter(
      ClearFilter event, Emitter<AnnouncementListState> emit) async {
    emit(state.copyWith(
      saleType: SaleType.all,
      currency: Currency.none,
      gearboxType: const GearboxTypeEntity(),
      bodyType: const BodyTypeEntity(),
      driveType: const DriveTypeEntity(),
      isFilter: false,
      historySaved: true,
      priceValuess: const RangeValues(0, 0),
      yearValuess: const RangeValues(0, 0),
      //! history saved -- param ni x qilganda caselarni ko'rish kerak
    ));
    add(const GetAnnouncementList());
  }

  FutureOr<void> _setRegions(
      SetRegions event, Emitter<AnnouncementListState> emit) async {
    emit(state.copyWith(regions: event.regions));
    add(const GetAnnouncementList());
  }

  FutureOr<void> _setSort(
      SetSort event, Emitter<AnnouncementListState> emit) async {
    emit(state.copyWith(sortResult: event.sortResult));
    add(const GetAnnouncementList());
  }

  FutureOr<void> _changeSaveFilterStatus(
      ChangeSaveFilterStatus event, Emitter<AnnouncementListState> emit) async {
    emit(state.copyWith(saveFilterStatus: event.status));
  }

  FutureOr<void> _saveHistory(
      SaveHistory event, Emitter<AnnouncementListState> emit) async {
    emit(state.copyWith(saveFilterStatus: FormzStatus.submissionInProgress));
    final saveFilterModel = SaveFilterModel(
        id: state.historyId,
        make: state.make?.id,
        model: [state.modelId],
        query:
            'make=${state.make?.id ?? ''}&model=${state.modelId ?? ''}&body_type=${state.bodyType?.id == -1 ? '' : state.bodyType?.id}'
            '&drive_type=${state.driveType?.id == -1 ? '' : state.driveType?.id}&gearbox_type=${state.gearboxType?.id == -1 ? '' : state.gearboxType?.id}&is_new=${state.isNeww ?? ''}'
            '&region__in=${getRegionsId(state.regions)}&price_from=${state.priceValuess?.start.toInt() == -1 ? '' : state.priceValuess?.start.toInt()}'
            '&price_to${state.priceValuess?.end.toInt() == -1 ? '' : state.priceValuess?.end.toInt()}&year_from=${state.yearValuess?.start.toInt() == -1 ? '' : state.yearValuess?.start.toInt()}'
            '&year_to=${state.yearValuess?.end.toInt() == -1 ? '' : state.yearValuess?.end.toInt()}&currency=${state.currency?.value}',
        queryData: QueryDataModel(
          bodyType: state.bodyType,
          driveType: state.driveType,
          gearboxType: state.gearboxType,
          regionIn: getRegionsId(state.regions),
          priceFrom: state.priceValuess?.start.toInt(),
          priceTo: state.priceValuess?.end.toInt(),
          yearFrom: state.yearValuess?.start.toInt(),
          yearTo: state.yearValuess?.start.toInt(),
          currency: state.currency?.value,
        ));
    final result = await saveFilterHistoryUseCase.call(saveFilterModel);
    if (result.isRight) {
      emit(state.copyWith(
          saveFilterStatus: FormzStatus.submissionSuccess,
          historySaved: true,
          saveFilterModel: saveFilterModel,
          isFilter: false));
    }
  }

  FutureOr<void> _changeAppBar(
      ChangeAppBarEvent event, Emitter<AnnouncementListState> emit) async {
    emit(state.copyWith(crossFadeState: event.crossFadeState));
  }

  FutureOr<void> _getAnnouncementList(
      GetAnnouncementList event, Emitter<AnnouncementListState> emit) async {
    emit(state.copyWith(
      status: FormzStatus.submissionInProgress,
    ));

    final result = await useCase.call({
      'make': state.make?.id == -1 ? '' : state.make?.id,
      'model': state.modelId == -1 ? '' : state.modelId,
      'body_type': state.bodyType?.id == -1 ? '' : state.bodyType?.id,
      'drive_type': state.driveType?.id == -1 ? '' : state.driveType?.id,
      'gearbox_type': state.gearboxType?.id == -1 ? '' : state.gearboxType?.id,
      'is_new': state.isNeww,
      'region__in': getRegionsId(state.regions),
      'price_from': state.priceValuess?.start == -1
          ? ''
          : state.priceValuess?.start == 0.0
              ? ''
              : state.priceValuess?.start,
      'price_to': state.priceValuess?.end == -1
          ? ''
          : state.priceValuess?.end == 0.0
              ? ''
              : state.priceValuess?.end,
      'year_from': state.yearValuess?.start == -1
          ? ''
          : state.yearValuess?.start == 0.0
              ? ''
              : state.yearValuess?.start,
      'year_to': state.yearValuess?.end == -1
          ? ''
          : state.yearValuess?.end == 0.0
              ? ''
              : state.yearValuess?.end,
      'is_rent_with_purchase': state.saleType.toApi,
      'limit': 10,
      'offset': 0,
      'currency': state.currency?.value,
      'ordering': state.sortStatus?.value,
    });
    if (result.isRight) {
      emit(
        state.copyWith(
            announcementList: result.right.results,
            status: FormzStatus.submissionSuccess,
            count: result.right.count,
            next: result.right.next != null,
            sortResult: state.sortStatus),
      );
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  String getRegionsId(List<RegionEntity> list) {
    if (list.isEmpty) {
      return '';
    }
    final ids = StringBuffer();
    for (final value in list) {
      ids.write('${value.id},');
    }
    return ids.toString();
  }
}
