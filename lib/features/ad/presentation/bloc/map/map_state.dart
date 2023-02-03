part of 'map_bloc.dart';

class MapState extends Equatable {
  final FormzStatus status;
  final FormzStatus getCurrentLocationStatus;
  final String? pointName;
  final int radius;
  final double lat;
  final double long;
  const MapState({
    required this.status,
    required this.getCurrentLocationStatus,
    this.lat = 0,
    this.long = 0,
    this.radius = 0,
    this.pointName,
  });
  MapState copyWith({
    int? radius,
    double? lat,
    double? long,
    FormzStatus? status,
    FormzStatus? getCurrentLocationStatus,
    String? pointName,
  }) =>
      MapState(
        pointName: pointName ?? this.pointName,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        radius: radius ?? this.radius,
        status: status ?? this.status,
        getCurrentLocationStatus:
            getCurrentLocationStatus ?? this.getCurrentLocationStatus,
      );
  @override
  List<Object?> get props => [
        pointName,
        status,
        getCurrentLocationStatus,
        radius,
        lat,
        long,
      ];
}
