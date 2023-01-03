part of 'map_organization_bloc.dart';

@Freezed()
class MapOrganizationEvent with _$MapOrganizationEvent {
  factory MapOrganizationEvent.getDealers({double? latitude, double? longitude, double? radius}) = _GetDealers;
  factory MapOrganizationEvent.changeRadius({required int radius}) = _ChangeRadius;
  factory MapOrganizationEvent.getCurrentLocation(
      {required ValueChanged<String> onError, required ValueChanged<Position> onSuccess}) = _GetCurrentLocation;
  factory MapOrganizationEvent.changeLatLong({required double lat, required double long, int? radius}) = _ChangeLatLong;
}
