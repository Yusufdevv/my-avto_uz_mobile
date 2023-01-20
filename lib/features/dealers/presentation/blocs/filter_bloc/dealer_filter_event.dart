part of 'dealer_filter_bloc.dart';

abstract class DealerFilterEvent {}
class  DealerFilterClearEvent  extends DealerFilterEvent  {}

class DealerFilterSelectEvent extends DealerFilterEvent {
  List<Region>? region;
  final MakeEntity? maker;
  final String? car_type;
  DealerFilterSelectEvent({
    this.maker,
    this.region,
    this.car_type,
      });
}
