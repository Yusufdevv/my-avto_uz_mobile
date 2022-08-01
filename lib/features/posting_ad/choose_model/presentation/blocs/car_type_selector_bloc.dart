import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'car_type_selector_event.dart';
part 'car_type_selector_state.dart';

class CarTypeSelectorBloc extends Bloc<CarTypeSelectorEvent, CarTypeSelectorState> {
  CarTypeSelectorBloc() : super(const CarTypeSelectorState(confirmId: -1, selectedId: -1)) {
    on<SelectedCarTypeEvent>((event, emit) {
      emit(state.copyWith(selectedId: event.id));
    });
    on<ConfirmCarTypeEvent>((event, emit) {
      emit(state.copyWith(confirmId: state.selectedId));
    });
    on<RevertCarTypeEvent>((event, emit) {
      emit(state.copyWith(selectedId: state.confirmId));
    });

  }
}
