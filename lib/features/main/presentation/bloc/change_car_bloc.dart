import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_car_event.dart';
part 'change_car_state.dart';

class ChangeCarBloc extends Bloc<ChangeCarEvent, ChangeCarState> {
  ChangeCarBloc() : super(const ChangeCarState(selectedId: -1, confirmId: -1)) {
    on<SelectedChangeCarItemEvent>((event, emit) {
      emit(state.copyWith(selectedId: event.id));
    });
    on<ConfirmChangeCarOption>((event, emit){
      emit(state.copyWith(confirmId: state.selectedId));
    });
    on<RevertChangeCarOption>((event, emit){
      emit(state.copyWith(selectedId: state.confirmId));
    });
  }
}
