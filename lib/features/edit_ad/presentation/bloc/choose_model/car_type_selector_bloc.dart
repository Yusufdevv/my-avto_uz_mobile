import 'dart:async';

import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'car_type_selector_event.dart';
part 'car_type_selector_state.dart';

class CarModelSelectorBloc
    extends Bloc<CarModelSelectorEvent, CarModelSelectorState> {
  final int makeId;
  GetCarModelUseCase useCase;
  CarModelSelectorBloc({required this.useCase, required this.makeId})
      : super(const CarModelSelectorState(
            selectedModelId: -1, status: FormzStatus.pure)) {
    on<CarModelSelectorGetEvent>(_get);
    on<SelectedCarTypeEvent>(_select);
  }
  FutureOr<void> _select(event, Emitter<CarModelSelectorState> emit) {
    emit(state.copyWith(selectedModelId: event.id));
  }

  FutureOr<void> _get(CarModelSelectorGetEvent event,
      Emitter<CarModelSelectorState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await useCase.call(makeId, name: event.searchPattern);
    if (result.isRight) {
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess, models: result.right.results));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
