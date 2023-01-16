part of 'cars_in_marks_bloc.dart';

@Freezed()
class CarsInMarksEvent with _$CarsInMarksEvent {
  factory CarsInMarksEvent.getResults({required CarMarkParams params}) = _GetResults;
}