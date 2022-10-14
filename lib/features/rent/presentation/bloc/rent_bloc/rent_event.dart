part of 'rent_bloc.dart';

@Freezed()
class RentEvent with _$RentEvent {
  factory RentEvent.getResults({required bool isRefresh}) = _GetResults;

  factory RentEvent.setId({
    required int id,
    int? hasAirConditioner,
    int? hasBabySeat,
    int? rentCarIsClean,
    int? rentCarIsFullFuel,
  }) = _SetId;

  factory RentEvent.getMoreResults() = _GetMoreResults;
}
