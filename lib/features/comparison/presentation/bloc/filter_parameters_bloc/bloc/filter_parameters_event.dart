part of 'filter_parameters_bloc.dart';

@freezed
class FilterParametersEvent with _$FilterParametersEvent {
  factory FilterParametersEvent.getIdVal(int id) = _GetIdVal;
}