part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final List<Region> regions;
  final MakeEntity? maker;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;
  final Currency currency;
  final RangeValues yearValues;
  final RangeValues priceValues;
  final bool isCheck;

  const FilterState({
    required this.priceValues,
    required this.yearValues,
    required this.regions,
    required this.isCheck,
    this.maker,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.currency = Currency.usd,
  });

  FilterState copyWith({
    List<Region>? regions,
    MakeEntity? maker,
    BodyTypeEntity? bodyType,
    DriveTypeEntity? carDriveType,
    GearboxTypeEntity? gearboxType,
    RangeValues? yearValues,
    RangeValues? priceValues,
    Currency? currency,
    bool? isCheck,
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
        isCheck
      ];
}
