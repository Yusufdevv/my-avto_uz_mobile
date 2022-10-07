part of 'rent_list_bloc.dart';

@Freezed()
class RentListEvent with _$RentListEvent {
  factory RentListEvent.getResults(
      {required bool isRefresh,
      required int id,
      required String search}) = _GetResults;
  factory RentListEvent.getMoreResults() = _GetMoreResults;
}
