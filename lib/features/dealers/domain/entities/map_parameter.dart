import 'package:equatable/equatable.dart';

class MapParameter extends Equatable {
  final double lat;
  final double long;
  final int radius;
  const MapParameter(
      {required this.lat,
        required this.long,
        required this.radius});

  MapParameter copyWith({
    double? lat,
    double? long,
    int? radius,
  }) =>
      MapParameter(
          lat: lat ?? this.lat,
          long: long ?? this.long,
          radius: radius ?? this.radius);

  @override
  List<Object?> get props => [
    lat,long,radius,
  ];

  @override
  String toString() => 'MapParameter(lat: $lat, long: $long, radius: $radius)';
}
