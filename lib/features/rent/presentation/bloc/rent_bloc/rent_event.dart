part of 'rent_bloc.dart';

abstract class RentEvent {
  final bool isRefresh;
  const RentEvent({required this.isRefresh});
}

class RentGetResultsEvent extends RentEvent {
  RentGetResultsEvent({required bool isRefresh}) : super(isRefresh: isRefresh);
}

class RentSetIdEvent extends RentEvent {
  final int id;
  int? hasAirConditioner;
  int? hasBabySeat;
  int? rentCarIsClean;
  int? rentCarIsFullFuel;
  RentSetIdEvent({
    required this.id,
    required bool isRefresh,
    this.hasAirConditioner,
    this.hasBabySeat,
    this.rentCarIsClean,
    this.rentCarIsFullFuel,
  }) : super(isRefresh: isRefresh);
}

class RentChangeSearchParamEvent extends RentEvent {
  final ParamKey paramKey;
  final bool value;
  RentChangeSearchParamEvent(
      {required this.paramKey, required this.value, required bool isRefresh})
      : super(isRefresh: isRefresh);
}

class RentGetMoreEvent extends RentEvent {
  RentGetMoreEvent({required bool isRefresh}) : super(isRefresh: isRefresh);
}
