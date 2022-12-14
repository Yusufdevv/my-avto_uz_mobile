import 'package:auto/features/ad/data/models/announcement.dart';
import 'package:auto/features/ad/data/models/body_type.dart';
import 'package:auto/features/ad/data/models/car_model.dart';
import 'package:auto/features/ad/data/models/drive_type.dart';
import 'package:auto/features/ad/data/models/engine_type.dart';
import 'package:auto/features/ad/data/models/gearbox_type.dart';
import 'package:auto/features/ad/data/models/generation.dart';
import 'package:auto/features/ad/data/models/make.dart';
import 'package:auto/features/ad/data/models/years.dart';
import 'package:auto/features/car_single/data/model/damaged_parts_model.dart';
import 'package:auto/features/reviews/data/models/modification_type_model.dart';

abstract class AdRemoteDataSource {
  Future<MakeModel> getTopMakes();

  Future<MakeModel> getMake();

  Future<CarModel> getCarModel({
    required int makeId,
  });

  Future<YearsModel> getYears({
    required int modelId,
  });

  Future<GenerationModel> getGeneration({
    required int modelId,
    required int year,
  });

  Future<BodyTypeModel> getBodyType({
    required int generationId,
  });

  Future<EngineTypeModel> getEngineType({
    required int generationId,
    required int bodyTypeId,
  });

  Future<DriveTypeModel> getDriveType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
  });

  Future<GearboxTypeModel> getGearboxType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
  });

  Future<ModificationTypeModel> getModificationType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
    required int gearBoxTypeTypeId,
  });

  Future<AnnouncementModel> createAnnouncement({
    required int make,
    required int model,
    required int bodyType,
    required int generation,
    required int driveType,
    required int engineType,
    required int gearboxType,
    required int year,
    required int modificationType,
    required String color,
    required String licenceType,
    required String ownership,
    required String purchaseDate,
    required String description,
    required bool isRegisteredLocally,
    required String contactName,
    required String contactEmail,
    required String contactPhone,
    required String contactAvailableFrom,
    required String contactAvailableTo,
    required int region,
    required int district,
    required String locationUrl,
    required String price,
    required String currency,
    required int distanceTraveled,
    required String registrationVin,
    required String registrationPlate,
    required String registrationCertificate,
    required String registrationSerialNumber,
    required bool registeredInUzbekistan,
    required bool isNew,
    required List<String> gallery,
    required List<DamagedPartsModel> damagedParts,
  });
}

class AdRemoteDataSourceImpl extends AdRemoteDataSource {
  @override
  Future<MakeModel> getTopMakes() {
    // TODO: implement getTopMakes
    throw UnimplementedError();
  }

  Future<MakeModel> getMake() {
    // TODO: implement getMake
    throw UnimplementedError();
  }

  @override
  Future<CarModel> getCarModel({required int makeId}) {
    // TODO: implement getCarModel
    throw UnimplementedError();
  }

  @override
  Future<YearsModel> getYears({required int modelId}) {
    // TODO: implement getYears
    throw UnimplementedError();
  }

  @override
  Future<GenerationModel> getGeneration(
      {required int modelId, required int year}) {
    // TODO: implement getGeneration
    throw UnimplementedError();
  }

  @override
  Future<BodyTypeModel> getBodyType({required int generationId}) {
    // TODO: implement getBodyType
    throw UnimplementedError();
  }

  @override
  Future<EngineTypeModel> getEngineType({
    required int generationId,
    required int bodyTypeId,
  }) {
    // TODO: implement getEngineType
    throw UnimplementedError();
  }

  @override
  Future<DriveTypeModel> getDriveType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
  }) {
    // TODO: implement getDriveType
    throw UnimplementedError();
  }

  @override
  Future<GearboxTypeModel> getGearboxType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
  }) {
    // TODO: implement getGearboxType
    throw UnimplementedError();
  }

  @override
  Future<ModificationTypeModel> getModificationType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
    required int gearBoxTypeTypeId,
  }) {
    // TODO: implement getModificationType
    throw UnimplementedError();
  }

  @override
  Future<AnnouncementModel> createAnnouncement({
    required int make,
    required int model,
    required int bodyType,
    required int generation,
    required int driveType,
    required int engineType,
    required int gearboxType,
    required int year,
    required int modificationType,
    required String color,
    required String licenceType,
    required String ownership,
    required String purchaseDate,
    required String description,
    required bool isRegisteredLocally,
    required String contactName,
    required String contactEmail,
    required String contactPhone,
    required String contactAvailableFrom,
    required String contactAvailableTo,
    required int region,
    required int district,
    required String locationUrl,
    required String price,
    required String currency,
    required int distanceTraveled,
    required String registrationVin,
    required String registrationPlate,
    required String registrationCertificate,
    required String registrationSerialNumber,
    required bool registeredInUzbekistan,
    required bool isNew,
    required List<String> gallery,
    required List<DamagedPartsModel> damagedParts,
  }) {
    // TODO: implement createAnnouncement
    throw UnimplementedError();
  }
}
