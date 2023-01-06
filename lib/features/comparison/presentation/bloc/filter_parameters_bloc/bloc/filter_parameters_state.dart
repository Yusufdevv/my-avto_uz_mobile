part of 'filter_parameters_bloc.dart';

@Freezed()
class FilterParametersState with _$FilterParametersState {
  const factory FilterParametersState({
    @Default(0) int idVal,
  }) = _FilterParametersState;
}
