part of 'map_bloc.dart';

class MapState extends Equatable {
  final FormzStatus status;
  final FormzStatus getCurrentLocationStatus;
  final int radius;
  final double lat;
  final double long;
  final String? address;

  const MapState({
    required this.status,
    required this.getCurrentLocationStatus,
    this.lat = 0,
    this.long = 0,
    this.radius = 0,
    this.address ,
  });

  MapState copyWith({
    int? radius,
    double? lat,
    double? long,
    FormzStatus? status,
    FormzStatus? getCurrentLocationStatus,
    String? address,
  }) =>
      MapState(
        lat: lat ?? this.lat,
        long: long ?? this.long,
        radius: radius ?? this.radius,
        status: status ?? this.status,
        getCurrentLocationStatus:
            getCurrentLocationStatus ?? this.getCurrentLocationStatus,
        address: address ?? this.address,
      );

  @override
  List<Object?> get props => [
        status,
        getCurrentLocationStatus,
        radius,
        lat,
        long,
        address,
      ];
}
