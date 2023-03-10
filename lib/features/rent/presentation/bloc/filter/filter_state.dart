part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final List<RegionEntity> regions;
  final MakeEntity? maker;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;
  final Currency currency;
  final RangeValues yearValues;
  final RangeValues priceValues;
  final bool isCheck;
  final double? priceStart;
  final double? priceEnd;
  final double? yearStart;
  final double? yearEnd;
  final SaleType? saleType;

  const FilterState({
    required this.priceValues,
    required this.yearValues,
    required this.regions,
    required this.isCheck,
    this.saleType,
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
    SaleType? saleType,
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
        saleType: saleType ?? this.saleType,
        regions: regions ?? this.regions,
        maker: maker ?? this.maker,
        bodyType: bodyType?.id == -1 ? null : bodyType ?? this.bodyType,
        carDriveType:
            carDriveType?.id == -1 ? null : carDriveType ?? this.carDriveType,
        gearboxType:
            gearboxType?.id == -1 ? null : gearboxType ?? this.gearboxType,
        yearValues: yearValues ?? this.yearValues,
        priceValues: priceValues ?? this.priceValues,
        currency: currency ?? this.currency,
        isCheck: isCheck ?? this.isCheck,
        priceStart: priceStart ?? this.priceStart,
        priceEnd: priceEnd ?? this.priceEnd,
        yearStart: yearStart ?? this.yearStart,
        yearEnd: yearEnd ?? this.yearEnd,
      );

  Map<String, dynamic> get filterData {
    var data = <String, dynamic>{};
    if (maker != null) {
      data['make'] = maker!.id;
    }
    if (bodyType != null) {
      data['body_type'] = bodyType!.id;
    }
    if (gearboxType != null) {
      data['gearbox_type'] = gearboxType!.id;
    }
    if (carDriveType != null) {
      data['drive_type'] = carDriveType!.id;
    }
    data['price_to'] = priceValues.end;
    data['price_from'] = priceValues.start;
    data['year_from'] = yearValues.start;
    data['year_to'] = yearValues.end;

    return data;
  }

  @override
  List<Object?> get props => [
        saleType,
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
