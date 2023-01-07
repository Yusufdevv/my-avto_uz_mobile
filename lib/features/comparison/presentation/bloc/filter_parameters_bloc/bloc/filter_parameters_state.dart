part of 'filter_parameters_bloc.dart';

@Freezed()
class FilterParametersState with _$FilterParametersState {
  factory FilterParametersState({
    @Default(0) int idVal,
    @Default(GearboxTypeEntity(id: -1, type: '', logo: ''))
        GearboxTypeEntity gearboxTypeEntity,
    @Default(BodyTypeEntity(id: -1, type: '', logo: ''))
        BodyTypeEntity bodyTypeEntity,
    @Default(DriveTypeModel(id: -1, type: '', logo: ''))
        DriveTypeEntity driveTypeEntity,
  }) = _FilterParametersState;
}
