part of 'get_drive_types_bloc.dart';

class GetDriveTypesState extends Equatable {
  final FormzStatus status;
  final List<DriveTypeEntity> driveTypes;
  const GetDriveTypesState({required this.driveTypes, required this.status});
  GetDriveTypesState copyWith({
    FormzStatus? status,
    List<DriveTypeEntity>? driveTypes,
  }) =>
      GetDriveTypesState(
        driveTypes: driveTypes ?? this.driveTypes,
        status: status ?? this.status,
      );
  @override
  List<Object?> get props => [];
}
