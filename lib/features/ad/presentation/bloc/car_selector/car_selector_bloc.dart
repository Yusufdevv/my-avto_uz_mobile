
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'car_selector_event.dart';
part 'car_selector_state.dart';

class CarSelectorBloc extends Bloc<CarSelectorEvent, SelectedCarItems> {
  CarSelectorBloc() : super(const SelectedCarItems(confirmId: -1, selectedId: -1)) {
    on<SelectedCarItemEvent>((event, emit) {
      emit(state.copyWith(selectedId: event.id));
    });
    on<ConfirmCarOption>((event, emit){
      emit(state.copyWith(confirmId: state.selectedId));
    });
    on<RevertCarOption>((event, emit){
      emit(state.copyWith(selectedId: state.confirmId));
    });
  }
}
