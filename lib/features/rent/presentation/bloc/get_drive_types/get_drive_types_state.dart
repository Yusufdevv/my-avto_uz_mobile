part of 'get_drive_types_bloc.dart';

class GetDriveTypesState extends Equatable {
  final FormzStatus status;
  final int selected;
  final List<DriveTypeEntity> driveTypes;
  const GetDriveTypesState(
      {required this.driveTypes, required this.status, this.selected = -1});
  GetDriveTypesState copyWith(
          {FormzStatus? status,
          List<DriveTypeEntity>? driveTypes,
          int? selected}) =>
      GetDriveTypesState(
          selected: selected ?? this.selected,
          driveTypes: driveTypes ?? this.driveTypes,
          status: status ?? this.status);
  @override
  List<Object?> get props => [status, driveTypes, selected];
}
