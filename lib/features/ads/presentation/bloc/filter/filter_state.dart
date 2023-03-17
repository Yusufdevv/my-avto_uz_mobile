part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final MinMaxPriceYearEntity? usdIfos;

  final MinMaxPriceYearEntity? uzsIfos;
  final List<RegionEntity> regions;
  final MakeEntity? maker;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? driveType;
  final GearboxTypeEntity? gearboxType;
  final Currency currency;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final bool isRentWithPurchase;

  final SaleType saleType;
  final double? minYearValue;
  final double? maxYearValue;
  final double? minPriceValue;
  final double? maxPriceValue;

  const FilterState({
    required this.regions,
    required this.saleType,
    this.priceValues,
    this.yearValues,
    this.minYearValue,
    this.maxYearValue,
    this.minPriceValue,
    this.maxPriceValue,
    this.usdIfos,
    this.uzsIfos,
    this.isRentWithPurchase = false,
    this.maker,
    this.bodyType,
    this.driveType,
    this.gearboxType,
    this.currency = Currency.none,
  });

  FilterState copyWith({
    MinMaxPriceYearEntity? usdIfos,
    MinMaxPriceYearEntity? uzsIfos,
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
    bool? isRentWithPurchase,
    bool? isFilterCleared,
  }) =>
      FilterState(
        usdIfos: usdIfos ?? this.usdIfos,
        uzsIfos: uzsIfos ?? this.uzsIfos,
        minYearValue: minYearValue ?? this.minYearValue,
        maxYearValue: maxYearValue ?? this.maxYearValue,
        minPriceValue: minPriceValue ?? this.minPriceValue,
        maxPriceValue: maxPriceValue ?? this.maxPriceValue,
        isRentWithPurchase: isRentWithPurchase ?? this.isRentWithPurchase,
        saleType: saleType ?? this.saleType,
        regions: regions ?? this.regions,
        maker: maker ?? this.maker,
        bodyType: bodyType?.id == -1 ? null : bodyType ?? this.bodyType,
        driveType:
            carDriveType?.id == -1 ? null : carDriveType ?? this.driveType,
        gearboxType:
            gearboxType?.id == -1 ? null : gearboxType ?? this.gearboxType,
        yearValues: yearValues ?? this.yearValues,
        priceValues: priceValues ?? this.priceValues,
        currency: currency ?? this.currency,
      );

  @override
  List<Object?> get props => [
        usdIfos,
        uzsIfos,
        minYearValue,
        maxYearValue,
        minPriceValue,
        maxPriceValue,
        isRentWithPurchase,
        saleType,
        regions,
        maker,
        bodyType,
        driveType,
        gearboxType,
        yearValues,
        priceValues,
        currency,
      ];

  RangeValues getPriceValues(MinMaxPriceYearEntity? data) {
    if (data == null) return const RangeValues(1000, 500000);
    return RangeValues(
        double.parse(data.minPrice), double.parse(data.maxPrice));
  }

  RangeValues getYearValues(MinMaxPriceYearEntity? data) {
    if (data == null) {
      return RangeValues(1970, DateTime.now().year + 0);
    }
    return RangeValues(data.minYear + 0, data.maxYear + 0);
  }

  bool get isFilter {
    if (driveType != null && driveType?.id != -1) {
      return true;
    }
    if (bodyType != null && bodyType?.id != -1) {
      return true;
    }

    if (gearboxType != null && gearboxType?.id != -1) {
      return true;
    }

    if (currency == Currency.usd
        ? usdIsYearValuesChanged()
        : uzsIsYearValuesChanged()) {
      return true;
    }

    if (currency == Currency.usd
        ? usdIsPriceValuesChanged()
        : uzsIsPriceValuesChanged()) {
      return true;
    }

    if (saleType != SaleType.all) {
      return true;
    }

    if (currency != Currency.usd) {
      return true;
    }

    return false;
  }

  bool uzsIsPriceValuesChanged() {
    final start = double.tryParse(uzsIfos?.minPrice ?? '0') ?? 0.0;
    final end = double.tryParse(uzsIfos?.maxPrice ?? '0') ?? 0.0;
    final v = priceValues?.start != start || priceValues?.end != end;
    return v;
  }

  bool usdIsPriceValuesChanged() {
    final start = double.tryParse(usdIfos?.minPrice ?? '0') ?? 0.0;
    final end = double.tryParse(usdIfos?.maxPrice ?? '0') ?? 0.0;
    final v = priceValues?.start != start || priceValues?.end != end;
    return v;
  }

  bool usdIsYearValuesChanged() {
    final v = yearValues?.start != usdIfos?.minYear ||
        yearValues?.end != usdIfos?.maxYear;
    return v;
  }

  bool uzsIsYearValuesChanged() {
    final v = yearValues?.start != uzsIfos?.minYear ||
        yearValues?.end != uzsIfos?.maxYear;
    return v;
  }
}
