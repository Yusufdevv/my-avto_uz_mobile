part of 'instpection_place_bloc.dart';

class InspectionPlaceState extends Equatable {
  final FormzStatus getRegionsStatus;
  final FormzStatus getDistrictsStatus;
  final List<Region> regions;
  final List<DistrictEntity> districts;
  const InspectionPlaceState({
    required this.getRegionsStatus,
    required this.getDistrictsStatus,
    this.regions = const <Region>[],
    this.districts = const <DistrictEntity>[],
  });
  InspectionPlaceState copyWith(
          {FormzStatus? getRegionsStatus,
          FormzStatus? getDistrictsStatus,
          List<Region>? regions,
          List<DistrictEntity>? districts,
          int? selectedDistrictId}) =>
      InspectionPlaceState(
        districts: districts ?? this.districts,
        getDistrictsStatus: getDistrictsStatus ?? this.getDistrictsStatus,
        regions: regions ?? this.regions,
        getRegionsStatus: getRegionsStatus ?? this.getRegionsStatus,
      );
  @override
  List<Object?> get props => [
        getRegionsStatus,
        getDistrictsStatus,
        regions,
        districts,
      ];
}
