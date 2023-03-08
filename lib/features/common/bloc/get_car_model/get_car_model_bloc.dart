import 'dart:developer';

import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ads/domain/usecases/get_announcement_list_usecase.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_car_model_event.dart';

part 'get_car_model_state.dart';


class GetCarModelBloc extends Bloc<GetCarModelEvent, GetCarModelState> {
  final GetCarModelUseCase useCase = GetCarModelUseCase();
  GetAnnouncementListUseCase getAnnouncementListUseCase =
      GetAnnouncementListUseCase();

  GetCarModelBloc()
      : super(const GetCarModelState(
          status: FormzStatus.pure,
          getAnnouncementStatus: FormzStatus.pure,
        )) {
    on<GetCarModelGetEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(event.getId, name: event.search);
      if (result.isRight) {
        emit(
          state.copyWith(
            models: result.right.results,
            status: FormzStatus.submissionSuccess,
            count: result.right.count,
            next: result.right.next,
          ),
        );
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<GetCarModelGetMakeIdEvent>(
        (event, emit) => emit(state.copyWith(getId: event.id)));
    on<GetCarModelSelectModelEvent>((event, emit) {
      emit(state.copyWith(
          selectedId: event.selectedId, selectedModel: event.model));
    });
    on<GetCarModelConfirmModelEvent>((event, emit) {
      emit(state.copyWith(confirmId: state.selectedModel.id));
    });

    on<GetCarModelGetAnnouncementListEvent>((event, emit) async {
      if (event.makeId == -1 || event.modelId == -1) {
        return;
      }
      emit(state.copyWith(
          getAnnouncementStatus: FormzStatus.submissionInProgress));
      final result = await getAnnouncementListUseCase.call({
        'make': event.makeId == -1 ? null : event.makeId,
        'model': event.modelId == -1 ? null : event.modelId,
      });
      if (result.isRight) {
        emit(state.copyWith(
            announcementCount: result.right.count,
            getAnnouncementStatus: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(
            getAnnouncementStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
