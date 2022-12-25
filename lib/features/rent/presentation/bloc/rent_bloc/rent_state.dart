part of 'rent_bloc.dart';

class RentState extends Equatable {
  final List<RentMainEntity> list;
  final FormzStatus status;
  final FormzStatus paginationStatus;
  final String? next;
  final int count;
  final int categoryId;
  final int hasAirConditioners;
  final int hasBabySeat;
  final int rentCarIsClean;
  final int rentCarIsFullFuel;
  final List<Region>? regions;
  final List<int>? carMakers;
  final String? carBodyTypeId;
  final String? carDriveTypeId;
  final String? gearboxTypeId;

  const RentState({
    required this.list,
    required this.status,
    required this.paginationStatus,
    required this.next,
    required this.count,
    required this.categoryId,
    required this.hasAirConditioners,
    required this.hasBabySeat,
    required this.rentCarIsClean,
    required this.rentCarIsFullFuel,
    this.carMakers = const [],
    this.regions,
    this.carBodyTypeId,
    this.carDriveTypeId,
    this.gearboxTypeId,
  });

  RentState copyWith({
    List<Region>? region,
    List<int>? carMakers,
    String? carBodyTypeId,
    String? carDriveTypeId,
    String? gearboxTypeId,
    List<RentMainEntity>? list,
    FormzStatus? status,
    FormzStatus? paginationStatus,
    String? next,
    int? count,
    int? categoryId,
    int? hasAirConditioners,
    int? hasBabySeat,
    int? rentCarIsClean,
    int? rentCarIsFullFuel,
  }) =>
      RentState(
        regions: region ?? this.regions,
        carMakers: carMakers ?? this.carMakers,
        carBodyTypeId: carBodyTypeId ?? this.carBodyTypeId,
        carDriveTypeId: carDriveTypeId ?? this.carDriveTypeId,
        gearboxTypeId: gearboxTypeId ?? this.gearboxTypeId,
        list: list ?? this.list,
        status: status ?? this.status,
        paginationStatus: paginationStatus ?? this.paginationStatus,
        next: next ?? this.next,
        count: count ?? this.count,
        categoryId: categoryId ?? this.categoryId,
        hasAirConditioners: hasAirConditioners ?? this.hasAirConditioners,
        hasBabySeat: hasBabySeat ?? this.hasBabySeat,
        rentCarIsClean: rentCarIsClean ?? this.rentCarIsClean,
        rentCarIsFullFuel: rentCarIsFullFuel ?? this.rentCarIsFullFuel,
      );

  @override
  List<Object?> get props => [
        regions,
        carMakers,
        carBodyTypeId,
        carDriveTypeId,
        gearboxTypeId,
        list,
        status,
        paginationStatus,
        next,
        count,
        categoryId,
        hasAirConditioners,
        hasBabySeat,
        rentCarIsClean,
        rentCarIsFullFuel,
      ];
}
