part of 'dealer_card_bloc.dart';

@Freezed()
class DealerCardEvent with _$DealerCardEvent {
  factory DealerCardEvent.getResults({
    required bool isRefresh,
    required String search,
  }) = _GetResults;

  factory DealerCardEvent.getMoreResults() = _GetMoreResults;
}
