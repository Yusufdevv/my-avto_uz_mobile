part of 'instpection_place_bloc.dart';

class InspectionPlaceState extends Equatable {
  final FormzStatus status;
  final FormzStatus cityStatus;
  final List<Region> regions;
  const InspectionPlaceState(
      {required this.status,
      required this.cityStatus,
      this.regions = const <Region>[]});
  InspectionPlaceState copyWith(
          {FormzStatus? status,
          FormzStatus? cityStatus,
          List<Region>? regions}) =>
      InspectionPlaceState(
        cityStatus: cityStatus ?? this.cityStatus,
        regions: regions ?? this.regions,
        status: status ?? this.status,
      );
  @override
  List<Object?> get props => [status, regions, cityStatus];
}
