part of 'car_single_bloc.dart';

@Freezed()
class CarSingleEvent with _$CarSingleEvent {
  factory CarSingleEvent.getSingle(int id) = _GetSingle;
  factory CarSingleEvent.getOtherAds(String makeModel) = _GetAds;
  factory CarSingleEvent.getMoreOtherAds(String makeModel) = _GetMoreAds;
  factory CarSingleEvent.soldAds(int id, Function(String message) onSucc,
      Function(String errorMessage) onError) = _SoldAds;
  factory CarSingleEvent.callCount(int id) = _CallCount;
  factory CarSingleEvent.changeVerifyOwnerModerationEvent() = _ChangeVerifyOwnerModerationEvent;
}
