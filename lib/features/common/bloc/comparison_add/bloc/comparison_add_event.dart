part of 'comparison_add_bloc.dart';

@Freezed()
class ComparisonAddEvent with _$ComparisonAddEvent {
  factory ComparisonAddEvent.postComparisonCars(int id) = _PostComparisonCars;
}