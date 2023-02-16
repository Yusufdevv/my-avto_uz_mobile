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
  final List<Region> regions;
  final MakeEntity? maker;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;

  final RangeValues? yearValues;
  final RangeValues? priceValues;

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
    required this.regions,
    this.maker,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.priceValues,
    this.yearValues,
  });

  RentState copyWith({
    List<Region>? regions,
    MakeEntity? maker,
    BodyTypeEntity? bodyType,
    DriveTypeEntity? carDriveType,
    GearboxTypeEntity? gearboxType,
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
    RangeValues? yearValues,
    RangeValues? priceValues,
  }) =>
      RentState(
        regions: regions ?? this.regions,
        maker: maker ?? this.maker,
        bodyType: bodyType ?? this.bodyType,
        carDriveType: carDriveType ?? this.carDriveType,
        gearboxType: gearboxType ?? this.gearboxType,
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
        yearValues: yearValues ?? this.yearValues,
        priceValues: priceValues ?? this.priceValues,
      );

  @override
  List<Object?> get props => [
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
        maker,
        regions,
        bodyType,
        carDriveType,
        gearboxType,
        priceValues,
        yearValues,
      ];
}
