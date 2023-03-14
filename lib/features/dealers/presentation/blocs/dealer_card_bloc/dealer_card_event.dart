part of 'dealer_card_bloc.dart';

@Freezed()
class DealerCardEvent with _$DealerCardEvent {
  factory DealerCardEvent.getResults({
    required bool isRefresh,
    required String search,
    required ValueChanged<List<DealerCardEntity>> onSuccess,
    int? mark,
    String? regionId,
    String? carType,
  }) = _GetResults;
  factory DealerCardEvent.getFilterParams({
    String? regions,
    String? maker,
    String? carType,
  }) = _GetFilterParams;

  factory DealerCardEvent.changeTabIndex(
      {required int index}) = _ChangeTabIndex;
  factory DealerCardEvent.getMoreResults() = _GetMoreResults;
  factory DealerCardEvent.watchContact({required int id}) = _WatchContact;
}
