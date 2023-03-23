part of 'inspection_place_address_bloc.dart';

@immutable
abstract class InspectionPlaceAddressEvent {}

class GetAddressEvent extends InspectionPlaceAddressEvent {
  final double lat;
  final double long;

  GetAddressEvent({
    required this.lat,
    required this.long,
  });
}
