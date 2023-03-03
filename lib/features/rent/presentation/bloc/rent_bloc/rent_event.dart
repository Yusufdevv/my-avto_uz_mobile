part of 'rent_bloc.dart';

abstract class RentEvent {
  bool? isRefresh;
  RentEvent({this.isRefresh});
}

class RentGetResultsEvent extends RentEvent {
  RentGetResultsEvent({bool? isRefresh}) : super(isRefresh: isRefresh);
}

class RentGetResultsFromListEvent extends RentEvent {
  RentGetResultsFromListEvent({bool? isRefresh}) : super(isRefresh: isRefresh);
}

class RentSetIdEvent extends RentEvent {
  final int categoryId;
  int? hasAirConditioner;
  int? hasBabySeat;
  int? rentCarIsClean;
  int? rentCarIsFullFuel;
  RentSetIdEvent({
    required this.categoryId,
    required bool isRefresh,
    this.hasAirConditioner,
    this.hasBabySeat,
    this.rentCarIsClean,
    this.rentCarIsFullFuel,
  }) : super(isRefresh: isRefresh);
}

class RentGetMoreEvent extends RentEvent {
  RentGetMoreEvent({bool? isRefresh}) : super(isRefresh: isRefresh);
}

class RentSetParamFromFilterEvent extends RentEvent {
  List<RegionEntity>? regions;
  MakeEntity? maker;
  BodyTypeEntity? bodyType;
  DriveTypeEntity? carDriveType;
  GearboxTypeEntity? gearboxType;

  RangeValues? yearValues;
  RangeValues? priceValues;

  RentSetParamFromFilterEvent({
    this.regions,
    this.maker,
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.priceValues,
    this.yearValues,
  });
}
