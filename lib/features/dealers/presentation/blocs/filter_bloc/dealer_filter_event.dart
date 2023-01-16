part of 'dealer_filter_bloc.dart';

abstract class DealerFilterEvent {}
class  DealerFilterClearEvent  extends DealerFilterEvent  {


}

class DealerFilterSelectEvent extends DealerFilterEvent {
  List<Region>? regions;
  final MakeEntity? maker;
  final bool? car_type;
  DealerFilterSelectEvent({
    this.maker,
    this.regions,
    this.car_type,
      });
}
