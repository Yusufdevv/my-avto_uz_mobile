part of 'ad_manipulation_bloc.dart';

@freezed
class AdManipulationEvent with _$AdManipulationEvent {
  const factory AdManipulationEvent.setBodyType({required int bodyTypeId}) =
      _SetBodyType;

  const factory AdManipulationEvent.setCarModel({required int carModelId}) =
      _SetCarModel;

  const factory AdManipulationEvent.setDriveType({required int driveTypeId}) =
      _SetDriveType;

  const factory AdManipulationEvent.setGeneration({required int generationId}) =
      _SetGeneration;

  const factory AdManipulationEvent.setYear({required int year}) = _SetYear;
}
