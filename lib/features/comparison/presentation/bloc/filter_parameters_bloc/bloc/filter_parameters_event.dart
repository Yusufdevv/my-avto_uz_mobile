part of 'filter_parameters_bloc.dart';

@freezed
class FilterParametersEvent with _$FilterParametersEvent {
  factory FilterParametersEvent.getIdVal(int id) = _GetIdVal;
  factory FilterParametersEvent.getDriveType(DriveTypeEntity entity) = _GetDriveType;
  factory FilterParametersEvent.getBodyType(BodyTypeEntity entity) = _GetBodyType;
  factory FilterParametersEvent.getGearboxType(GearboxTypeEntity entity) = _GetGearboxType;
}