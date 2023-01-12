import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'date_picker_event.dart';
part 'date_picker_state.dart';

class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {
  DatePickerBloc() : super(const DatePickerState(date: '')) {
    on<PickedDate>((event, emit) {
      emit(state.copyWith(date: event.date));
    });
  }
}
