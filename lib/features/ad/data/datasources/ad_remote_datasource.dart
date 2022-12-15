import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/data/models/body_type.dart';
import 'package:auto/features/ad/data/models/car_model.dart';
import 'package:auto/features/ad/data/models/drive_type.dart';
import 'package:auto/features/ad/data/models/engine_type.dart';
import 'package:auto/features/ad/data/models/gearbox_type.dart';
import 'package:auto/features/ad/data/models/generation.dart';
import 'package:auto/features/ad/data/models/make.dart';
import 'package:auto/features/ad/data/models/years.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reviews/data/models/modification_type_model.dart';
import 'package:dio/dio.dart';

abstract class AdRemoteDataSource {
  Future<GenericPagination<MakeModel>> getTopMakes();

  Future<GenericPagination<MakeModel>> getMake();

  Future<GenericPagination<CarModel>> getCarModel({
    required int makeId,
  });

  Future<GenericPagination<YearsModel>> getYears({
    required int modelId,
  });

  Future<GenericPagination<GenerationModel>> getGeneration({
    required int modelId,
    required int year,
  });

  Future<GenericPagination<BodyTypeModel>> getBodyType({
    required int generationId,
  });

  Future<GenericPagination<EngineTypeModel>> getEngineType({
    required int generationId,
    required int bodyTypeId,
  });

  Future<GenericPagination<DriveTypeModel>> getDriveType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
  });

  Future<GenericPagination<GearboxTypeModel>> getGearboxType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
  });

  Future<GenericPagination<ModificationTypeModel>> getModificationType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
    required int gearBoxTypeTypeId,
  });

  Future<void> createAnnouncement({
    required Map<String, dynamic> announcementMap,
  });
}

class AdRemoteDataSourceImpl extends AdRemoteDataSource {
  final Dio _dio;

  AdRemoteDataSourceImpl(this._dio);

  @override
  Future<GenericPagination<MakeModel>> getTopMakes() async {
    try {
      final response = await _dio.get(
        '/car/makes/top/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => MakeModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<MakeModel>> getMake() async {
    try {
      final response = await _dio.get(
        '/car/makes/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => MakeModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<CarModel>> getCarModel({required int makeId}) async {
    try {
      final response = await _dio.get(
        '/car/$makeId/models/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => CarModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<YearsModel>> getYears({required int modelId}) async {
    try {
      final response = await _dio.get(
        '/car/$modelId/years/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => YearsModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<GenerationModel>> getGeneration(
      {required int modelId, required int year}) async {
    try {
      final response = await _dio.get(
        '/car/$modelId/${year}generations/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => GenerationModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<BodyTypeModel>> getBodyType(
      {required int generationId}) async {
    try {
      final response = await _dio.get(
        '/car/$generationId/body-types/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => BodyTypeModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<EngineTypeModel>> getEngineType({
    required int generationId,
    required int bodyTypeId,
  }) async {
    try {
      final response = await _dio.get(
        '/car/$generationId/$bodyTypeId/engine_type/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => EngineTypeModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<DriveTypeModel>> getDriveType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
  }) async {
    try {
      final response = await _dio.get(
        '/car/$generationId/$bodyTypeId/$engineTypeId/drive_type/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => DriveTypeModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<GearboxTypeModel>> getGearboxType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
  }) async {
    try {
      final response = await _dio.get(
        '/car/$generationId/$bodyTypeId/$engineTypeId/$driveTypeId/gearbox_type',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => GearboxTypeModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<ModificationTypeModel>> getModificationType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
    required int gearBoxTypeTypeId,
  }) async {
    try {
      final response = await _dio.get(
        '/car/$generationId/$bodyTypeId/$engineTypeId/$driveTypeId/$gearBoxTypeTypeId/modification-type/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => ModificationTypeModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<void> createAnnouncement({
    required Map<String, dynamic> announcementMap,
  }) async {
    try {
      final response = await _dio.post(
        '/car/announcement/create/',
        data: announcementMap,
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
