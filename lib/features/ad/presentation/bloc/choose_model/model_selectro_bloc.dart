import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'model_selectro_event.dart';
part 'model_selectro_state.dart';

class ModelSelectorBloc extends Bloc<ModelSelectorEvent, ModelSelectorState> {
  ModelSelectorBloc()
      : super(
            const ModelSelectorState(selectedId: -1, confirmId: -1, name: '')) {
    on<SelectedModelItemEvent>((event, emit) {
      emit(state.copyWith(selectedId: event.id, name: event.name));
    });
    on<ConfirmModelOption>((event, emit) {
      emit(state.copyWith(confirmId: state.selectedId));
    });
    on<RevertModelOption>((event, emit) {
      emit(state.copyWith(selectedId: state.confirmId));
    });
  }
}
