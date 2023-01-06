part of 'get_gearboxes_bloc.dart';

abstract class GetGearboxesEvent {}

class GetGearboxesSelectEvent extends GetGearboxesEvent {
  final int index;
  GetGearboxesSelectEvent(this.index);
}

class GetGearboxesGetEvent extends GetGearboxesEvent {}
