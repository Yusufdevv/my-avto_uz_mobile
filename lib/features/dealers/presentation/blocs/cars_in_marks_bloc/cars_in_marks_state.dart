part of 'cars_in_marks_bloc.dart';

@Freezed()
class CarsInMarksState with _$CarsInMarksState {
  factory CarsInMarksState({
    @Default([]) List<CarsInMarksEntity> cars,
    @Default('') String? next,
    @Default(false) bool? moreFetch,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _CarsInMarksState;
}
