import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_parameters_event.dart';
part 'filter_parameters_state.dart';
part 'filter_parameters_bloc.freezed.dart';

class FilterParametersBloc
    extends Bloc<FilterParametersEvent, FilterParametersState> {
  FilterParametersBloc() : super(const FilterParametersState()) {
    on<_GetIdVal>((event, emit) {
      emit(state.copyWith(idVal: event.id));
    });
  }
}
