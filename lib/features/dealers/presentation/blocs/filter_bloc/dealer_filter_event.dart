part of 'dealer_filter_bloc.dart';

abstract class DealerFilterEvent {}

class DealerFilterClearEvent extends DealerFilterEvent {}

class DealerFilterSelectEvent extends DealerFilterEvent {
  List<Region>? region;
  final MakeEntity? maker;
  final String? carType;
  DealerFilterSelectEvent({
    this.maker,
    this.region,
    this.carType,
  });
}
