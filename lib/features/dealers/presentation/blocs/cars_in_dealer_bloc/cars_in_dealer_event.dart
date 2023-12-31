part of 'cars_in_dealer_bloc.dart';

@Freezed()
class CarsInDealerEvent with _$CarsInDealerEvent {
  factory CarsInDealerEvent.getResults({required String slug}) = _GetResults;
  factory CarsInDealerEvent.getMoreResults({required String slug}) =
      _GetMoreResults;
  factory CarsInDealerEvent.changeIsWish(
      {required int index, required int id}) = _ChangeIsWish;
}
