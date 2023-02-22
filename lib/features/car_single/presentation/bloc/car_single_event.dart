part of 'car_single_bloc.dart';

@Freezed()
class CarSingleEvent with _$CarSingleEvent {
  factory CarSingleEvent.getSingle(int id) = _GetSingle;
  factory CarSingleEvent.getOtherAds(int id) = _GetAds;
  factory CarSingleEvent.soldAds(int id, Function(String message) onSucc,
      Function(String errorMessage) onError) = _SoldAds;
  factory CarSingleEvent.callCount(int id) = _CallCount;
}
