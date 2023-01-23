part of 'dealer_card_bloc.dart';

@Freezed()
class DealerCardEvent with _$DealerCardEvent {
  factory DealerCardEvent.getResults({
    required bool isRefresh,
    required String search,
  }) = _GetResults;
  factory DealerCardEvent.getFilterResult({
    bool? isRefresh,
    String? mark,
    String? regionId,
    String? carType,
}) = _GetFilter;
  factory DealerCardEvent.getFilterParams({
    String? regions,
    String? maker,
    String? carType,
}) = _GetFilterParams;

  factory DealerCardEvent.getMoreResults() = _GetMoreResults;
}
