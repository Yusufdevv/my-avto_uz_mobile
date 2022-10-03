part of 'rent_list_bloc.dart';

@Freezed()
class RentListEvent with _$RentListEvent {
  factory RentListEvent.getResults({required bool isRefresh}) = _GetResults;
  factory RentListEvent.getMoreResults() = _GetMoreResults;
}
