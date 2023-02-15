import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ads/data/models/query_data_model.dart';
import 'package:auto/features/ads/data/models/search_history_model.dart';
import 'package:auto/features/ads/domain/usecases/get_announcement_list_usecase.dart';
import 'package:auto/features/ads/domain/usecases/get_min_max_price_use_case.dart';
import 'package:auto/features/ads/domain/usecases/save_filter_history_usecase.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
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
    on<GetAnnouncementList>((event, emit) async {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
        isNew: event.isNew,
      ));

      final result = await useCase.call({
        'make': state.makeId == -1 ? '' : state.makeId,
        'model': state.modelId == -1 ? '' : state.modelId,
        'body_type': state.bodyType?.id == -1 ? '' : state.bodyType?.id,
        'drive_type': state.driveType?.id == -1 ? '' : state.driveType?.id,
        'gearbox_type':
            state.gearboxType?.id == -1 ? '' : state.gearboxType?.id,
        'is_new': event.isNew,
        'region__in': getRegionsId(state.regions),
        'price_from':
            state.priceValues?.start == -1 ? '' : state.priceValues?.start,
        'price_to': state.priceValues?.end == -1 ? '' : state.priceValues?.end,
        'year_from':
            state.yearValues?.start == -1 ? '' : state.yearValues?.start,
        'year_to': state.yearValues?.end == -1 ? '' : state.yearValues?.end,
        'limit': 10,
        'offset': 0,
        'currency': state.currency?.value
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
        'make': state.makeId == -1 ? '' : state.makeId,
        'model': state.modelId == -1 ? '' : state.modelId,
        'body_type': state.bodyType?.id == -1 ? '' : state.bodyType?.id,
        'drive_type': state.driveType?.id == -1 ? '' : state.driveType?.id,
        'gearbox_type':
            state.gearboxType?.id == -1 ? '' : state.gearboxType?.id,
        'is_new': event.isNew,
        'region__in': getRegionsId(state.regions),
        'price_from':
            state.priceValues?.start == -1 ? '' : state.priceValues?.start,
        'price_to': state.priceValues?.end == -1 ? '' : state.priceValues?.end,
        'year_from':
            state.yearValues?.start == -1 ? '' : state.yearValues?.start,
        'year_to': state.yearValues?.end == -1 ? '' : state.yearValues?.end,
        'limit': 10,
        'offset': state.announcementList.length,
        'currency': state.currency?.value
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
      final result =
          await minMaxPriceYearUseCase.call(state.currency?.value ?? '');
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
        currency: event.currency,
        gearboxType: event.gearboxType,
        bodyType: event.bodyType,
        driveType: event.driveType,
        yearValues: event.yearValues,
        priceValues: event.priceValues,
        isFilter: event.isFilter,
        historyId: event.historyId ?? state.historyId,
        // ignore: avoid_bool_literals_in_conditional_expressions
        historySaved: event.historySaved,
      ));

      add(GetAnnouncementList(isNew: event.isNew));
    });
    on<SetMakeModel>((event, emit) {
      emit(state.copyWith(
        makeId: event.makeId,
        modelId: event.modelId,
        makeName: event.makeName,
        modelName: event.modelName,
        makeLogo: event.makeLogo,
        historySaved: event.historySaved,
      ));
      add(GetAnnouncementList(isNew: event.isNew));
    });
    on<ClearFilter>((event, emit) {
      add(const GetMinMaxPriceYear());
      emit(state.copyWith(
        currency: Currency.euro,
        gearboxType: const GearboxTypeEntity(),
        bodyType: const BodyTypeEntity(),
        driveType: const DriveTypeEntity(),
        isFilter: false,
        historySaved: true,
        //! history saved -- param ni x qilganda caselarni ko'rish kerak
      ));
      add(GetAnnouncementList(isNew: event.isNew));
    });
    on<SetRegions>((event, emit) {
      emit(state.copyWith(regions: event.regions));
      add(GetAnnouncementList(isNew: event.isNew));
    });
    on<ChangeSaveFilterStatus>((event, emit) {
      emit(state.copyWith(saveFilterStatus: event.status));
    });
    on<SaveHistory>((event, emit) async {
      final saveFilterModel = SaveFilterModel(
          id: state.historyId,
          make: state.makeId,
          model: [state.modelId],
          query:
              'make=${state.makeId ?? ''}&model=${state.modelId ?? ''}&body_type=${state.bodyType?.id == -1 ? '' : state.bodyType?.id}'
              '&drive_type=${state.driveType?.id == -1 ? '' : state.driveType?.id}&gearbox_type=${state.gearboxType?.id == -1 ? '' : state.gearboxType?.id}&is_new=${state.isNew ?? ''}'
              '&region__in=${getRegionsId(state.regions)}&price_from=${state.priceValues?.start.toInt() == -1 ? '' : state.priceValues?.start.toInt()}'
              '&price_to${state.priceValues?.end.toInt() == -1 ? '' : state.priceValues?.end.toInt()}&year_from=${state.yearValues?.start.toInt() == -1 ? '' : state.yearValues?.start.toInt()}'
              '&year_to=${state.yearValues?.end.toInt() == -1 ? '' : state.yearValues?.end.toInt()}&currency=${state.currency?.value}',
          queryData: QueryDataModel(
            bodyType: state.bodyType,
            driveType: state.driveType,
            gearboxType: state.gearboxType,
            regionIn: getRegionsId(state.regions),
            priceFrom: state.priceValues?.start.toInt(),
            priceTo: state.priceValues?.end.toInt(),
            yearFrom: state.yearValues?.start.toInt(),
            yearTo: state.yearValues?.start.toInt(),
            currency: state.currency?.value,
          ));
      final result = await saveFilterHistoryUseCase.call(saveFilterModel);
      if (result.isRight) {
        emit(state.copyWith(
            historySaved: true,
            saveFilterModel: saveFilterModel,
            isFilter: false));
      }
    });
    on<ChangeAppBarEvent>((event, emit) {
      emit(state.copyWith(crossFadeState: event.crossFadeState));
    });
  }

  String getRegionsId(List<Region> list) {
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
