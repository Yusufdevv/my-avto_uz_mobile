part of 'delete_comparison_bloc.dart';

@Freezed()
class DeleteComparisonEvent with _$DeleteComparisonEvent {
  const factory DeleteComparisonEvent.deleteComparison(int id) =
      _DeleteComparisonE;
}
