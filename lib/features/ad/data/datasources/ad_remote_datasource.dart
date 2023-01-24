// ignore_for_file: avoid_catches_without_on_clauses

import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/data/models/announcement_filter.dart';
import 'package:auto/features/ad/data/models/body_type.dart';
import 'package:auto/features/ad/data/models/drive_type.dart';
import 'package:auto/features/ad/data/models/engine_type.dart';
import 'package:auto/features/ad/data/models/gearbox_type.dart';
import 'package:auto/features/ad/data/models/generation.dart';
import 'package:auto/features/ad/data/models/modification_type.dart';
import 'package:auto/features/ad/data/models/years.dart';
import 'package:auto/features/common/entities/makes_entity.dart';
import 'package:auto/features/common/models/get_make_model.dart';
import 'package:auto/features/comparison/data/models/announcement_list_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reviews/data/models/make_model.dart';
import 'package:dio/dio.dart';

abstract class AdRemoteDataSource {
  Future<num> getMinimumPrice(Map<String, dynamic> params);
  Future<bool> verify(Map<String, String> params);
  Future<String> sendCode({required String phone});

  Future<GenericPagination<MakeModel>> getTopMakes({String? next});

  Future<GetMakeEntity> getMake({String? name});

  Future<GetMakeEntity> getCarModel(int makeId, {String? name});

  Future<GenericPagination<YearsModel>> getYears({
    required int modelId,
    String? next,
  });

  Future<GenericPagination<GenerationModel>> getGeneration({
    required int modelId,
    required int year,
    String? next,
  });

  Future<GenericPagination<BodyTypeModel>> getBodyType({
    required int generationId,
    String? next,
  });
  Future<GenericPagination<BodyTypeModel>> bodyTypesGet();

  Future<GenericPagination<EngineTypeModel>> getEngineType({
    required int generationId,
    required int bodyTypeId,
    String? next,
  });

  Future<GenericPagination<DriveTypeModel>> getDriveType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    String? next,
  });
  Future<GenericPagination<DriveTypeModel>> driveTypesGet();

  Future<GenericPagination<GearboxTypeModel>> getGearboxType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
    String? next,
  });

  Future<GenericPagination<GearboxTypeModel>> gearboxessGet();

  Future<GenericPagination<ModificationTypeModel>> getModificationType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
    required int gearBoxTypeTypeId,
    String? next,
  });

  Future<void> createAnnouncement({
    required FormData announcementFormData,
  });

  Future<GenericPagination<AnnouncementListModel>> getAnnouncementList(
    AnnouncementFilterModel filter,
  );
  Future<void> filterHistory();
}

class AdRemoteDataSourceImpl extends AdRemoteDataSource {
  final Dio _dio;

  AdRemoteDataSourceImpl(this._dio);

  @override
  Future<GenericPagination<MakeModel>> getTopMakes({
    String? next,
  }) async {
    final response = await _dio.get(
      next!.isEmpty ? '/car/makes/top/' : next,
    );
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return GenericPagination.fromJson(response.data,
          (p0) => MakeModel.fromJson(p0 as Map<String, dynamic>));
    } else {
      throw ServerException(
          statusCode: response.statusCode!, errorMessage: response.data);
    }
  }

  @override
  Future<GetMakeEntity> getMake({String? name}) async {
    try {
      final response = await _dio.get(
        '/car/makes/',
        queryParameters: {'search': name, 'limit': 1000, 'offset': 0},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GetMakeModel.fromJson(response.data);
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } catch (e) {
      throw ServerException(statusCode: -1, errorMessage: e.toString());
    }
  }

  @override
  Future<GetMakeEntity> getCarModel(int makeId, {String? name}) async {
    final response = await _dio.get('/car/$makeId/models/',
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString('token')}'
                }
              : {},
        ),
        queryParameters:
            name == null ? null : {'search': name, 'limit': 100, 'offset': 0});
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return GetMakeModel.fromJson(response.data);
    } else {
      throw ServerException(
          statusCode: response.statusCode!, errorMessage: response.data);
    }
  }

  @override
  Future<GenericPagination<YearsModel>> getYears({
    required int modelId,
    String? next,
  }) async {
    final response = await _dio.get(
      '/car/$modelId/years/',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
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
  }

  @override
  Future<GenericPagination<GenerationModel>> getGeneration({
    required int modelId,
    required int year,
    String? next,
  }) async {
    try {
      final response = await _dio.get(
        '/car/$modelId/${year}generations/',
        //    car/24/1992generations/
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
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<BodyTypeModel>> getBodyType({
    required int generationId,
    String? next,
  }) async {
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
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<BodyTypeModel>> bodyTypesGet({
    String? next,
  }) async {
    try {
      final response = await _dio.get(
        '/car/body-types/',
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
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
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
    String? next,
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
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
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
    String? next,
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
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<DriveTypeModel>> driveTypesGet() async {
    try {
      final response = await _dio.get(
        '/car/drive-types/',
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
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
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
    String? next,
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
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<GearboxTypeModel>> gearboxessGet() async {
    try {
      final response = await _dio.get(
        '/car/gearbox-types/',
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
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
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
    String? next,
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
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
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
    required FormData announcementFormData,
  }) async {
    try {
      final response = await _dio.post(
        '/car/announcement/create/',
        data: announcementFormData,
        options: Options(
          headers: StorageRepository.getString('token').isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString('token')}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<AnnouncementListModel>> getAnnouncementList(
    AnnouncementFilterModel filter,
  ) async {
    try {
      final response = await _dio.get(
        '/car/announcement/list/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
        queryParameters: filter.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => AnnouncementListModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
          statusCode: response.statusCode!,
          errorMessage: response.data.toString(),
        );
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
  Future<void> filterHistory() async {
    try {
      final response = await _dio.post('users/filter-history/create/',
          data: {
            'id': 0,
            'make': 89,
            'model': [4070],
            'query': 'string',
            'query_data': {}
          },
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
      } else {
        throw ServerException(
          statusCode: response.statusCode!,
          errorMessage: response.data.toString(),
        );
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
  Future<String> sendCode({required String phone}) async {
    try {
      final response = await _dio.post(
        '/car/announcement/sms-verification/entrypoint/',
        data: {'phone_number': phone},
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
        try {
          return response.data['session'];
        } catch (e) {
          return e.toString();
        }
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<bool> verify(Map<String, String> params) async {
    try {
      final response = await _dio.post(
        '/car/announcement/sms-verification/verify',
        data: params,
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
        return response.data['verified'];
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<num> getMinimumPrice(Map<String, dynamic> params) async {
    try {
      final response = await _dio.post(
        '/car/min-car-price/',
        data: params,
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
        return response.data['min_price'];
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
