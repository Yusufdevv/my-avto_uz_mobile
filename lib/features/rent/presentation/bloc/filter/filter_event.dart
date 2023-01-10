part of 'filter_bloc.dart';

abstract class FilterEvent {}
    class  FilterClearEvent  extends FilterEvent  {
      

}

class FilterSelectEvent extends FilterEvent {
  List<Region>? regions;
  final MakeEntity? maker;
  final BodyTypeEntity? bodyType;
  final DriveTypeEntity? carDriveType;
  final GearboxTypeEntity? gearboxType;
  final RangeValues? yearValues;
  final RangeValues? priceValues;
  final int? idVal;
  FilterSelectEvent({
    this.bodyType,
    this.carDriveType,
    this.gearboxType,
    this.maker,
    this.priceValues,
    this.regions,
    this.yearValues,
    this.idVal
  });
}
