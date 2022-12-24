import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/datasources/ad_local_datasource.dart';
import 'package:auto/features/ad/data/datasources/ad_remote_datasource.dart';
import 'package:auto/features/ad/data/models/announcement.dart';
import 'package:auto/features/ad/domain/entities/announcement/announcement.dart';
import 'package:auto/features/ad/domain/entities/car_model/car_model_entity.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

class AdRepositoryImpl extends AdRepository {
  final AdRemoteDataSource remoteDataSource;
  // final AdLocalDataSource localDataSource;

  AdRepositoryImpl({
    required this.remoteDataSource,
    // required this.localDataSource,
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
    required int generationId,
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
  Future<Either<Failure, GetMakeEntity>> getCarModel(int makeId) async {
    try {
      final result = await remoteDataSource.getCarModel(makeId);
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
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
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
  Future<Either<Failure, GenericPagination<EngineTypeEntity>>> getEngineType({
    required int generationId,
    required int bodyTypeId,
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
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
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
  Future<Either<Failure, GenericPagination<GenerationEntity>>> getGeneration({
    required int modelId,
    required int year,
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
      final result = await remoteDataSource.getMake(name: name!);
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
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
    required int gearBoxTypeTypeId,
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

  // @override
  // Future<Either<Failure, GenericPagination<MakeEntity>>> getTopMakes({
  //   String? next,
  // }) async {
  //   try {
  //     final result = await remoteDataSource.getTopMakes(next: next);
  //     return Right(result);
  //   } on DioException {
  //     return Left(DioFailure());
  //   } on ParsingException catch (e) {
  //     return Left(ParsingFailure(errorMessage: e.errorMessage));
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(
  //       errorMessage: e.errorMessage,
  //       statusCode: e.statusCode,
  //     ));
  //   }
  // }

  @override
  Future<Either<Failure, GenericPagination<YearsEntity>>> getYears({
    required int modelId,
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

// ╔╗───────────╔╗─╔═══╗──╔╗
// ║║───────────║║─╚╗╔╗║─╔╝╚╗
// ║║──╔══╦══╦══╣║──║║║╠═╩╗╔╬══╗
// ║║─╔╣╔╗║╔═╣╔╗║║──║║║║╔╗║║║╔╗║
// ║╚═╝║╚╝║╚═╣╔╗║╚╗╔╝╚╝║╔╗║╚╣╔╗║
// ╚═══╩══╩══╩╝╚╩═╝╚═══╩╝╚╩═╩╝╚╝

  // @override
  // Future<Either<Failure, void>> cacheDraftAnnouncement({
  //   required AnnouncementEntity announcementEntity,
  // }) async {
  //   try {
  //     final result = await localDataSource.cacheDraftAnnouncement(
  //         announcementModel: announcementEntity as AnnouncementModel);
  //     return Right(result);
  //     return Right('');
  //   } on ParsingException catch (e) {
  //     return Left(ParsingFailure(errorMessage: e.errorMessage));
  //   }
  // }

  // @override
  // Future<Either<Failure, AnnouncementEntity>> getDraftAnnouncement() async {
  //   try {
  //     final result = await localDataSource.getDraftAnnouncement();
  //     return Right(result);

  //   } on ParsingException catch (e) {
  //     return Left(ParsingFailure(errorMessage: e.errorMessage));
  //   }
  // }
}
