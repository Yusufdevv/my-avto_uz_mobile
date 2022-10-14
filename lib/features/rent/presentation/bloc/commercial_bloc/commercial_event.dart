part of 'commercial_bloc.dart';

@Freezed()
class CommercialEvent with _$CommercialEvent {
  factory CommercialEvent.getResults({required bool isRefresh}) = _GetResults;

  factory CommercialEvent.getMoreResults() = _GetMoreResults;
}
