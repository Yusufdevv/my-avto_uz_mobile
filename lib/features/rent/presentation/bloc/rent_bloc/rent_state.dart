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
  final MakeEntity? maker;
  final String? carBodyTypeId;
  final String? carDriveTypeId;
  final String? gearboxTypeId;
  final String? yearStart;
  final String? yearEnd;
  final num? priceStart;
  final num? priceEnd;

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
    this.maker,
    this.regions,
    this.carBodyTypeId,
    this.carDriveTypeId,
    this.gearboxTypeId,
    this.priceEnd,
    this.priceStart,
    this.yearEnd,
    this.yearStart,
  });

  RentState copyWith({
    List<Region>? regions,
    MakeEntity? maker,
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
    String? yearStart,
    String? yearEnd,
    num? priceStart,
    num? priceEnd,
  }) =>
      RentState(
        regions: regions ?? this.regions,
        maker: maker ?? this.maker,
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
        priceEnd: priceEnd ?? this.priceEnd,
        priceStart: priceStart ?? this.priceStart,
        yearEnd: yearEnd ?? this.yearEnd,
        yearStart: yearStart ?? this.yearStart,
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
        carBodyTypeId,
        carDriveTypeId,
        gearboxTypeId,
        priceEnd,
        priceStart,
        yearEnd,
        yearStart,
      ];
}
