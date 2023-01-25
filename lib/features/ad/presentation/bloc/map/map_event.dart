part of 'map_bloc.dart';

abstract class MapEvent {}

class MapGetCurrentLocationEvent extends MapEvent {
  final Function(Position) onSuccess;
  final Function(String) onError;
  MapGetCurrentLocationEvent({
    required this.onSuccess,
    required this.onError,
  });
}

class MapChangeLatLongEvent extends MapEvent {
  final double lat;
  final double long;
  int? radius;
  MapChangeLatLongEvent({required this.lat, required this.long, this.radius});
}
