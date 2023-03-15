part of 'filter_bloc.dart';

abstract class FilterEvent {
  const FilterEvent();
}

class FilterClearEvent extends FilterEvent {
  const FilterClearEvent();
}

class FilterSelectEvent extends FilterEvent {
  List<RegionEntity>? regions;
  final MakeEntity? maker;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final Currency? currency;
  final SaleType? saleType;

  FilterSelectEvent({
    this.saleType,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.maker,
    this.priceValues,
    this.regions,
    this.yearValues,
    this.currency,
  });
}

class FilterGetCurrencies extends FilterEvent {
  final Currency currency;
  final bool yearValuesIsNull;
  final bool priceValuesIsNull;

  const FilterGetCurrencies({
    required this.currency,
    this.yearValuesIsNull = false,
    this.priceValuesIsNull = false,
  });
}
