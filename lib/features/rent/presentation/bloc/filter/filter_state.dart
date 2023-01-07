part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final List<Region>? regions;
  final MakeEntity? maker;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;

  final RangeValues yearValues;
  final RangeValues priceValues;

  const FilterState({
    required this.priceValues,
    required this.yearValues,
    this.maker,
    this.regions,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
  });

  FilterState copyWith({
    List<Region>? regions,
    MakeEntity? maker,
    BodyTypeEntity? bodyType,
    DriveTypeEntity? carDriveType,
    GearboxTypeEntity? gearboxType,
    RangeValues? yearValues,
    RangeValues? priceValues,
  }) =>
      FilterState(
        regions: regions ?? this.regions,
        maker: maker ?? this.maker,
        bodyType: bodyType ?? this.bodyType,
        carDriveType: carDriveType ?? this.carDriveType,
        gearboxType: gearboxType ?? this.gearboxType,
        yearValues: yearValues ?? this.yearValues,
        priceValues: priceValues ?? this.priceValues,
      );

  @override
  List<Object?> get props => [
        maker,
        regions,
        bodyType,
        carDriveType,
        gearboxType,
        priceValues,
        yearValues,
      ];
}