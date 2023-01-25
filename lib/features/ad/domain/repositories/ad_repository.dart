import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/models/announcement_filter.dart';
import 'package:auto/features/ad/domain/entities/generation/generation.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/engine_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/entities/types/modification_type.dart';
import 'package:auto/features/ad/domain/entities/years/years.dart';
import 'package:auto/features/common/entities/makes_entity.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class AdRepository {
  Future<Either<Failure, bool>> verify({required Map<String, String> params});

  Future<Either<Failure, num>> getMinimumPrice({required Map<String, dynamic> params});
  Future<Either<Failure, String>> sendCode({required String phone});
  Future<Either<Failure, GenericPagination<MakeEntity>>> getTopMakes(
      {String? next});
  Future<Either<Failure, GetMakeEntity>> getMake({String? name});

  Future<Either<Failure, GetMakeEntity>> getCarModel(int makeId,
      {String? name});

  Future<Either<Failure, GenericPagination<YearsEntity>>> getYears({
    required int modelId,
    String? next,
  });

  Future<Either<Failure, GenericPagination<GenerationEntity>>> getGeneration({
    required int modelId,
    required int year,
    String? next,
  });

  Future<Either<Failure, GenericPagination<BodyTypeEntity>>> getBodyType({
    required int generationId,
    String? next,
  });

  Future<Either<Failure, GenericPagination<BodyTypeEntity>>> getBodyTypes();

  Future<Either<Failure, GenericPagination<EngineTypeEntity>>> getEngineType({
    required int generationId,
    required int bodyTypeId,
    String? next,
  });

  Future<Either<Failure, GenericPagination<DriveTypeEntity>>> getDriveType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    String? next,
  });

  Future<Either<Failure, GenericPagination<DriveTypeEntity>>> driveTypesGet();

  Future<Either<Failure, GenericPagination<GearboxTypeEntity>>> getGearboxType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
    String? next,
  });

  Future<Either<Failure, GenericPagination<GearboxTypeEntity>>> gearboxessGet();

  Future<Either<Failure, GenericPagination<ModificationTypeEntity>>>
      getModificationType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
    required int gearBoxTypeTypeId,
    String? next,
  });

  Future<Either<Failure, void>> createAnnouncement({
    required FormData announcementFormData,
  });

  Future<Either<Failure, GenericPagination<AnnouncementListEntity>>>
      getAnnouncementList(AnnouncementFilterModel filter);
}
