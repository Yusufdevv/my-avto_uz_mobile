part of 'map_organization_bloc.dart';

@Freezed()
class MapOrganizationEvent with _$MapOrganizationEvent {
  factory MapOrganizationEvent.getDealers(
      {double? latitude,
      double? longitude,
      double? radius,
      required ValueChanged<List<MapEntity>> onSuccess}) = _GetDealers;

  factory MapOrganizationEvent.getDirectoriesPoints(
      {double? latitude,
      double? longitude,
      double? radius}) = _GetDirectoriesPoints;

  factory MapOrganizationEvent.getCurrentLocation(
      {required ValueChanged<String> onError,
      required ValueChanged<Position> onSuccess}) = _GetCurrentLocation;

  factory MapOrganizationEvent.changeLatLong(
      {required double lat,
      required double long,
      int? radius}) = _ChangeLatLong;

  factory MapOrganizationEvent.getAddressOfDealler(
      {required double lat,
      required double long,
      MapEntity? currentDealer}) = _GetAddressOfDealler;

  factory MapOrganizationEvent.setMapPoints({
    @Default([]) List<DealerCardModel> list,
  }) = _SetMapPoints;
}
