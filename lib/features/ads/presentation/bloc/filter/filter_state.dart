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
      log(':::::::::: IS FILTER:  driveType:  $driveType}  ::::::::::');
      return true;
    }
    if (bodyType != null && bodyType?.id != -1) {
      log('::::::::::  IS FILTER: bodyType:  $bodyType}  ::::::::::');
      return true;
    }

    if (gearboxType != null && gearboxType?.id != -1) {
      log(':::::::::: IS FILTER:  gearboxType:  $gearboxType}  ::::::::::');
      return true;
    }

    if (currency == Currency.usd
        ? usdIsYearValuesChanged('l-131')
        : uzsIsYearValuesChanged('l-132')) {
      log(':::::::::: IS FILTER: UZS YEAR VALUES: ${uzsIsYearValuesChanged('132 - 131')}  ::::::::::');
      return true;
    }

    if (currency == Currency.usd
        ? usdIsPriceValuesChanged('l-138')
        : uzsIsPriceValuesChanged('l-139')) {
      log(':::::::::: IS FILTER: USD PRICE VALUES: ${usdIsPriceValuesChanged('138 - 139')}  ::::::::::');
      return true;
    }

    if (saleType != SaleType.all) {
      log(':::::::::: IS FILTER:  saleType:  $saleType}  ::::::::::');
      return true;
    }

    if (currency != Currency.usd) {
      log('::::::::::  IS FILTER: currency:  $currency}  ::::::::::');
      return true;
    }

    log(':::::::::: IS FILTER: RETURNING FALSE:     ::::::::::');

    return false;
  }

  bool uzsIsPriceValuesChanged(String where) {
    final start = double.tryParse(uzsIfos?.minPrice ?? '0') ?? 0.0;
    final end = double.tryParse(uzsIfos?.maxPrice ?? '0') ?? 0.0;
    final v = priceValues?.start != start && priceValues?.end != end;
    log('::::::::::  PRICE USD: $v  $where }  ::::::::::');
    return v;
  }

  bool usdIsPriceValuesChanged(String where) {
    final start = double.tryParse(usdIfos?.minPrice ?? '0') ?? 0.0;
    final end = double.tryParse(usdIfos?.maxPrice ?? '0') ?? 0.0;
    final v = priceValues?.start != start && priceValues?.end != end;
    log('::::::::::  PRICE USD: $v  $where }  ::::::::::');
    return v;
  }

  bool usdIsYearValuesChanged(String where) {
    final v = yearValues?.start != usdIfos?.minYear &&
        yearValues?.end != usdIfos?.maxYear;
    log(':::::::::: e  YEAR USD: $v  $where  year values}  ::::::::::');
    log('::::::::::  start:  ${yearValues?.start}  ::::::::::');
    log('::::::::::  minYear:  ${usdIfos?.minYear}  ::::::::::');
    log('::::::::::  end:  ${yearValues?.end}  ::::::::::');
    log('::::::::::  maxYear:  ${usdIfos?.maxYear}  ::::::::::');
    return v;
  }

  bool uzsIsYearValuesChanged(String where) {
    final v = yearValues?.start != uzsIfos?.minYear &&
        yearValues?.end != uzsIfos?.maxYear;
    log(':::::::::: YEAR UZS: $v  $where ::::::::::');
    log('::::::::::   start:    ${yearValues?.start} ::::::::::');
    log('::::::::::   minYear:    ${uzsIfos?.minYear} ::::::::::');
    log('::::::::::   end:    ${yearValues?.end} ::::::::::');
    log('::::::::::   maxYear:    ${uzsIfos?.maxYear} ::::::::::');
    return v;
  }
}
