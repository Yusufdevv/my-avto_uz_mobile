import 'dart:async';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ads/domain/usecases/get_announcement_list_usecase.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'get_car_model_event.dart';

part 'get_car_model_state.dart';

class CarModelsBloc extends Bloc<CarModelsEvent, CarModelsState> {
  final GetCarModelUseCase useCase = GetCarModelUseCase();
  GetAnnouncementListUseCase getAnnouncementListUseCase =
      GetAnnouncementListUseCase();

  CarModelsBloc({required int initialSelectedId})
      : super(CarModelsState(
          model: MakeEntity(id: initialSelectedId),
          status: FormzStatus.pure,
          getAnnouncementStatus: FormzStatus.pure,
        )) {
    on<CarModelsChooseEvent>(_choose);
    on<CarModelsGetAnnouncementsEvent>(_getAnnouncements);
    on<CarModelsGetEvent>(_get);
  }

  FutureOr<void> _get(
      CarModelsGetEvent event, Emitter<CarModelsState> emit) async {
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
  }

  FutureOr<void> _getAnnouncements(CarModelsGetAnnouncementsEvent event,
      Emitter<CarModelsState> emit) async {
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
      emit(
          state.copyWith(getAnnouncementStatus: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _choose(
      CarModelsChooseEvent event, Emitter<CarModelsState> emit) async {
    emit(
      state.copyWith(
        model: event.model,
        getId: event.getId,
      ),
    );
  }
}
