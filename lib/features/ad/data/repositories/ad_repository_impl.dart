import 'dart:typed_data';

import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/datasources/ad_remote_datasource.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_entity.dart';
import 'package:auto/features/ad/domain/entities/foto_instruction_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/gas_equipment_entity.dart';
import 'package:auto/features/ad/domain/entities/generation/generation.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/entities/types/engine_type.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/entities/types/modification_type.dart';
import 'package:auto/features/ad/domain/entities/years/years.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/common/entities/makes_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

class AdRepositoryImpl extends AdRepository {
  final AdRemoteDataSource remoteDataSource;

  AdRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, void>> createAnnouncement({
    required FormData announcementFormData,
  }) async {
    try {
      await remoteDataSource.createAnnouncement(
        announcementFormData: announcementFormData,
      );
      return Right('success');
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<BodyTypeEntity>>> getBodyType({
    required int? generationId,
    String? next,
  }) async {
    try {
      final result = await remoteDataSource.getBodyType(
          generationId: generationId, next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<BodyTypeEntity>>>
      getBodyTypes() async {
    try {
      final result = await remoteDataSource.bodyTypesGet();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GetMakeEntity>> getCarModel(int makeId,
      {String? name}) async {
    try {
      final result = await remoteDataSource.getCarModel(makeId, name: name);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<DriveTypeEntity>>> getDriveType({
    required int? generationId,
    required int? bodyTypeId,
    required int? engineTypeId,
    String? next,
  }) async {
    try {
      final result = await remoteDataSource.getDriveType(
        generationId: generationId,
        bodyTypeId: bodyTypeId,
        engineTypeId: engineTypeId,
        next: next,
      );
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<DriveTypeEntity>>>
      driveTypesGet() async {
    try {
      final result = await remoteDataSource.driveTypesGet();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<EngineTypeEntity>>> getEngineType({
    required int? generationId,
    required int? bodyTypeId,
    String? next,
  }) async {
    try {
      final result = await remoteDataSource.getEngineType(
        generationId: generationId,
        bodyTypeId: bodyTypeId,
        next: next,
      );
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<GearboxTypeEntity>>> getGearboxType({
    int? generationId,
    int? bodyTypeId,
    int? engineTypeId,
    int? driveTypeId,
    String? next,
  }) async {
    try {
      final result = await remoteDataSource.getGearboxType(
        generationId: generationId,
        bodyTypeId: bodyTypeId,
        engineTypeId: engineTypeId,
        driveTypeId: driveTypeId,
        next: next,
      );
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<GearboxTypeEntity>>>
      gearboxessGet() async {
    try {
      final result = await remoteDataSource.gearboxessGet();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<GenerationEntity>>> getGeneration({
    int? modelId,
    int? year,
    String? next,
  }) async {
    try {
      final result = await remoteDataSource.getGeneration(
        modelId: modelId,
        year: year,
        next: next,
      );
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, GetMakeEntity>> getMake({String? name}) async {
    try {
      final result = await remoteDataSource.getMake(name: name);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<ModificationTypeEntity>>>
      getModificationType({
    int? generationId,
    int? bodyTypeId,
    int? engineTypeId,
    int? driveTypeId,
    int? gearBoxTypeTypeId,
    String? next,
  }) async {
    try {
      final result = await remoteDataSource.getModificationType(
        generationId: generationId,
        bodyTypeId: bodyTypeId,
        engineTypeId: engineTypeId,
        driveTypeId: driveTypeId,
        gearBoxTypeTypeId: gearBoxTypeTypeId,
        next: next,
      );
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<MakeEntity>>> getTopMakes({
    String? next,
  }) async {
    try {
      final result = await remoteDataSource.getTopMakes(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<YearsEntity>>> getYears({
    int? modelId,
    String? next,
  }) async {
    try {
      final result =
          await remoteDataSource.getYears(modelId: modelId, next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, String>> sendCode({required String phone}) async {
    try {
      final result = await remoteDataSource.sendCode(phone: phone);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, bool>> verify(
      {required Map<String, String> params}) async {
    try {
      final result = await remoteDataSource.verify(params);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, num>> getMinimumPrice(
      {required Map<String, dynamic> params}) async {
    try {
      final result = await remoteDataSource.getMinimumPrice(params);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, Uint8List>> getMapScreenShot(
      {required Map<String, String> params}) async {
    try {
      final result = await remoteDataSource.getMapScreenShot(params);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<FotoInstructionEntity>>>
      getFotoInstructions() async {
    try {
      final result = await remoteDataSource.getFotoInstructions();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> updateAnnouncement({
    required FormData announcementFormData,
    required int id,
  }) async {
    try {
      await remoteDataSource.updateAnnouncement(
        announcementFormData: announcementFormData,
        id: id,
      );
      return Right('success');
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<GasEquipmentEntity>>>
      getGasEquipments({String? search, int? limit, int? offset}) async {
    try {
      final result = await remoteDataSource.getGasEquipments(
        search: search,
        limit: limit,
        offset: offset,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, GenericPagination<EquipmentEntity>>> getEquipments(
      {String? search, int? limit, int? offset, int? modelId}) async {
    try {
      final result = await remoteDataSource.getEquipments(
        search: search,
        limit: limit,
        offset: offset,
        modelId: modelId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }
}
