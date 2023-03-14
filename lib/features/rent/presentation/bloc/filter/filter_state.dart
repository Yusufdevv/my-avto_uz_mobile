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
  final bool isRentWithPurchase;


  final SaleType? saleType;
  final double minYearValue;
  final double maxYearValue;
  final double minPriceValue;
  final double maxPriceValue;

  const FilterState({
    required this.priceValues,
    required this.yearValues,
    required this.regions,
    required this.minYearValue,
    required this.maxYearValue,
    required this.minPriceValue,
    required this.maxPriceValue,
    this.isRentWithPurchase = false,
    this.saleType,

    this.maker,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.currency = Currency.none,
  });

  FilterState copyWith({
    double? minYearValue,
    double? maxYearValue,
    double? minPriceValue,
    double? maxPriceValue,
    SaleType? saleType,
    List<RegionEntity>? regions,
    MakeEntity? maker,
    BodyTypeEntity? bodyType,
    DriveTypeEntity? carDriveType,
    GearboxTypeEntity? gearboxType,
    RangeValues? yearValues,
    RangeValues? priceValues,
    Currency? currency,
    bool? isCheckk,
    bool? isRentWithPurchase,

  }) =>
      FilterState(
        minYearValue: minYearValue ?? this.minYearValue,
        maxYearValue: maxYearValue ?? this.maxYearValue,
        minPriceValue: minPriceValue ?? this.minPriceValue,
        maxPriceValue: maxPriceValue ?? this.maxPriceValue,
        isRentWithPurchase: isRentWithPurchase ?? this.isRentWithPurchase,
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
        minYearValue,
        maxYearValue,
        minPriceValue,
        maxPriceValue,
        isRentWithPurchase,
        saleType,
        regions,
        maker,
        bodyType,
        carDriveType,
        gearboxType,
        yearValues,
        priceValues,
        currency,

      ];
}
