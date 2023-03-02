part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final List<RegionEntity> regions;
  final MakeEntity? maker;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;
  final Currency? currency;
  final RangeValues yearValues;
  final RangeValues priceValues;
  final bool isCheck;
  final double? priceStart;
  final double? priceEnd;
  final double? yearStart;
  final double? yearEnd;

  const FilterState({
    required this.priceValues,
    required this.yearValues,
    required this.regions,
    required this.isCheck,
    this.priceStart,
    this.priceEnd,
    this.yearStart,
    this.yearEnd,
    this.maker,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.currency = Currency.none,
  });

  FilterState copyWith({
    List<RegionEntity>? regions,
    MakeEntity? maker,
    BodyTypeEntity? bodyType,
    DriveTypeEntity? carDriveType,
    GearboxTypeEntity? gearboxType,
    RangeValues? yearValues,
    RangeValues? priceValues,
    Currency? currency,
    bool? isCheck,
    double? priceStart,
    double? priceEnd,
    double? yearStart,
    double? yearEnd,
  }) =>
      FilterState(
        regions: regions ?? this.regions,
        maker: maker ?? this.maker,
        bodyType: bodyType ?? this.bodyType,
        carDriveType: carDriveType ?? this.carDriveType,
        gearboxType: gearboxType ?? this.gearboxType,
        yearValues: yearValues ?? this.yearValues,
        priceValues: priceValues ?? this.priceValues,
        currency: currency ?? this.currency,
        isCheck: isCheck ?? this.isCheck,
        priceStart: priceStart ?? this.priceStart,
        priceEnd: priceEnd ?? this.priceEnd,
        yearStart: yearStart ?? this.yearStart,
        yearEnd: yearEnd ?? this.yearEnd,
      );

  @override
  List<Object?> get props => [
        regions,
        maker,
        bodyType,
        carDriveType,
        gearboxType,
        yearValues,
        priceValues,
        currency,
        isCheck,
        priceStart,
        priceEnd,
        yearEnd,
        yearStart,
      ];
}
