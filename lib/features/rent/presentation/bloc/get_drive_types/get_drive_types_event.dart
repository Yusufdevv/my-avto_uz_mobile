part of 'get_drive_types_bloc.dart';

abstract class GetDriveTypesEvent {}

class GetDriveTypesSelectEvent extends GetDriveTypesEvent {
  final int index;
  GetDriveTypesSelectEvent(this.index);
}

class GetDriveTypesGetEvent extends GetDriveTypesEvent {}
