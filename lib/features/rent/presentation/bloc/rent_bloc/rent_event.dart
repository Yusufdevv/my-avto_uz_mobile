part of 'rent_bloc.dart';

@Freezed()
class RentEvent with _$RentEvent {
  factory RentEvent.getResults({required bool isRefresh}) = _GetResults;

  factory RentEvent.getMoreResults() = _GetMoreResults;
}
