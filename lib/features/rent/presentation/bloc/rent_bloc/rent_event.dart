part of 'rent_bloc.dart';

abstract class RentEvent {
  bool? isRefresh;
  RentEvent({this.isRefresh});
}

class RentGetResultsEvent extends RentEvent {
  RentGetResultsEvent({bool? isRefresh}) : super(isRefresh: isRefresh);
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
  List<Region>? regions;
  String? carMakerId;
  String? carBodyTypeId;
  String? carDriveTypeId;
  String? gearboxTypeId;

  RentSetParamFromFilterEvent({
    this.regions,
    this.carMakerId,
    this.carBodyTypeId,
    this.carDriveTypeId,
    this.gearboxTypeId,
  });
}
