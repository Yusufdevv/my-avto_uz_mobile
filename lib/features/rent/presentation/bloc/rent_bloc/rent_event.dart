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

class RentCleanFilterEvent extends RentEvent {}

class RentSetParamFromFilterEvent extends RentEvent {
  List<Region>? regions;
  MakeEntity? maker;
  String? carBodyTypeId;
  String? carDriveTypeId;
  String? gearboxTypeId;
  String? yearStart;
  String? yearEnd;
  num? priceStart;
  num? priceEnd;

  RentSetParamFromFilterEvent({
    this.regions,
    this.maker,
    this.carBodyTypeId,
    this.carDriveTypeId,
    this.gearboxTypeId,
    this.priceEnd,
    this.priceStart,
    this.yearEnd,
    this.yearStart,
  });
}
