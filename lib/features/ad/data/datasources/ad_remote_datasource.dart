// ignore_for_file: avoid_catches_without_on_clauses, prefer_final_locals

import 'dart:convert';
import 'dart:typed_data';

import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/data/models/body_type.dart';
import 'package:auto/features/ad/data/models/drive_type.dart';
import 'package:auto/features/ad/data/models/engine_type.dart';
import 'package:auto/features/ad/data/models/equipment/equipment_model.dart';
import 'package:auto/features/ad/data/models/equipment/equipment_options_list_model.dart';
import 'package:auto/features/ad/data/models/equipment/equipment_options_model.dart';
import 'package:auto/features/ad/data/models/equipment/gas_equipment_model.dart';
import 'package:auto/features/ad/data/models/foto_instruction_model.dart';
import 'package:auto/features/ad/data/models/gearbox_type.dart';
import 'package:auto/features/ad/data/models/generation.dart';
import 'package:auto/features/ad/data/models/modification_type.dart';
import 'package:auto/features/ad/data/models/years.dart';
import 'package:auto/features/ad/domain/entities/foto_instruction_entity.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/common/entities/color_entity.dart';
import 'package:auto/features/common/models/color_model.dart';

// import 'package:auto/features/common/entities/makes_entity.dart';
// import 'package:auto/features/common/models/get_make_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reviews/data/models/make_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class AdRemoteDataSource {
  Future<GenericPagination<FotoInstructionEntity>> getFotoInstructions();

  Future<Uint8List> getMapScreenShot(Map<String, String> params);

  Future<num> getMinimumPrice(Map<String, dynamic> params);

  Future<bool> verify(Map<String, String> params);

  Future<String> sendCode({required String phone});

  Future<GenericPagination<MakeModel>> getTopMakes({String? next});

  Future<GenericPagination<ColorEntity>> getColors({String? next});

  Future<GenericPagination<MakeEntity>> getMake(
      {required int limit, required int offset, String? name, String? next});

  Future<GenericPagination<MakeModel>> getCarModel(int makeId,
      {String? name, String? next});

  Future<YearsModel> getYears({
    int? modelId,
    String? next,
  });

  Future<GenericPagination<GenerationModel>> getGeneration({
    int? modelId,
    int? year,
    String? next,
  });

  Future<GenericPagination<BodyTypeModel>> getBodyType({
    int? generationId,
    String? next,
  });

  Future<GenericPagination<BodyTypeModel>> bodyTypesGet();

  Future<GenericPagination<EngineTypeModel>> getEngineType({
    int? generationId,
    int? bodyTypeId,
    String? next,
  });

  Future<GenericPagination<DriveTypeModel>> getDriveType({
    int? generationId,
    int? bodyTypeId,
    int? engineTypeId,
    String? next,
  });

  Future<GenericPagination<DriveTypeModel>> driveTypesGet();

  Future<GenericPagination<GearboxTypeModel>> getGearboxType({
    int? generationId,
    int? bodyTypeId,
    int? engineTypeId,
    int? driveTypeId,
    String? next,
  });

  Future<GenericPagination<GearboxTypeModel>> gearboxessGet();

  Future<GenericPagination<ModificationTypeModel>> getModificationType({
    int? generationId,
    int? bodyTypeId,
    int? engineTypeId,
    int? driveTypeId,
    int? gearBoxTypeTypeId,
    String? next,
  });

  Future<void> createAnnouncement({
    required FormData announcementFormData,
  });

  Future<void> updateAnnouncement({
    required FormData announcementFormData,
    required int id,
  });

  Future<GenericPagination<GasEquipmentModel>> getGasEquipments({
    String? search,
    int? limit,
    int? offset,
  });

  Future<GenericPagination<EquipmentModel>> getEquipments({
    String? search,
    int? limit,
    int? offset,
    int? modelId,
  });

  Future<GenericPagination<EquipmentOptionsListModel>> getEquipmentOptionsList({
    String? search,
    int? limit,
    int? offset,
  });

  Future<GenericPagination<EquipmentOptionsModel>> getEquipmentOptions({
    String? search,
    int? limit,
    int? offset,
    int? equipmentId,
  });
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
  Future<GenericPagination<MakeEntity>> getMake({
    required int limit,
    required int offset,
    String? name,
    String? next,
  }) async {
    try {
      final response = await _dio.get(
        next ?? '/car/makes/',
        queryParameters: next == null
            ? {
                'search': name,
                'limit': limit,
                'offset': offset,
                'ordering': 'name'
              }
            : {},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => MakeModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            statusCode: response.statusCode!, errorMessage: response.data);
      }
    } catch (e) {
      throw ServerException(statusCode: -1, errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<MakeModel>> getCarModel(int? makeId,
      {String? name, String? next}) async {
    final response = await _dio.get(
      next ?? '/car/$makeId/models/',
      options: Options(
        headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
            ? {
                'Authorization':
                    'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
              }
            : {},
      ),
      queryParameters:
          next == null ? {'search': name, 'limit': 10, 'offset': 0} : null,
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
  Future<YearsModel> getYears({
    int? modelId,
    String? next,
  }) async {
    final response = await _dio.get(
      '/car/$modelId/years/',
      options: Options(
        headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
            ? {
                'Authorization':
                    'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
              }
            : {},
      ),
    );
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return YearsModel.fromJson(response.data);
    } else {
      throw ServerException(
          statusCode: response.statusCode!, errorMessage: response.data);
    }
  }

  @override
  Future<GenericPagination<GenerationModel>> getGeneration({
    int? modelId,
    int? year,
    String? next,
  }) async {
    try {
      final response = await _dio.get(
        '/car/$modelId/${year}generations/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
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
    int? generationId,
    String? next,
  }) async {
    try {
      final response = await _dio.get(
        '/car/$generationId/body-types/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
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
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
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
    int? generationId,
    int? bodyTypeId,
    String? next,
  }) async {
    try {
      final response = await _dio.get(
        '/car/$generationId/$bodyTypeId/engine_type/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
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
    int? generationId,
    int? bodyTypeId,
    int? engineTypeId,
    String? next,
  }) async {
    try {
      final response = await _dio.get(
        '/car/$generationId/$bodyTypeId/$engineTypeId/drive_type/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
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
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
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
    int? generationId,
    int? bodyTypeId,
    int? engineTypeId,
    int? driveTypeId,
    String? next,
  }) async {
    try {
      final response = await _dio.get(
        '/car/$generationId/$bodyTypeId/$engineTypeId/$driveTypeId/gearbox_type',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
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
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
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
    int? generationId,
    int? bodyTypeId,
    int? engineTypeId,
    int? driveTypeId,
    int? gearBoxTypeTypeId,
    String? next,
  }) async {
    try {
      final response = await _dio.get(
        '/car/$generationId/$bodyTypeId/$engineTypeId/$driveTypeId/$gearBoxTypeTypeId/modification-type/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
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
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
                }
              : {},
        ),
      );
      await Future.delayed(const Duration(milliseconds: 5000));
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
  Future<String> sendCode({required String phone}) async {
    try {
      final response = await _dio.post(
        '/car/announcement/sms-verification/entrypoint/',
        data: {'phone_number': phone},
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
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
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
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
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
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

  @override
  Future<GenericPagination<ColorEntity>> getColors({String? next}) async {
    try {
      final response = await _dio.get(
        '/common/colors/',
        queryParameters: {
          'limit': 40,
        },
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => ColorModel.fromJson(p0 as Map<String, dynamic>));
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
  Future<Uint8List> getMapScreenShot(Map<String, String> params) async {
    try {
      var headers = <String, String>{};

      final token = StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
          ? MapEntry('Authorization',
              'Token ${StorageRepository.getString(StorageKeys.TOKEN)}')
          : null;
      var list = <MapEntry<String, String>>[];
      if (token != null) {
        list.add(token);
      }
      list
        ..add(const MapEntry('accept', 'Application-json'))
        ..add(const MapEntry('accept', 'application/json'))
        ..add(const MapEntry('Content-Type', 'application/json'))
        ..add(MapEntry('Accept-Language',
            StorageRepository.getString(StorageKeys.LANGUAGE, defValue: 'uz')));

      headers.addEntries(list);
      final request = http.Request('POST',
          Uri.parse('https://panel.avto.uz/api/v1/common/map/screenshot'));
      // ignore: cascade_invocations
      request.body = json.encode(params);

      request.headers.addAll(headers);
      final response = await request.send();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final stack = await http.Response.fromStream(response);

        return stack.bodyBytes;
      }
      throw ServerException(statusCode: response.statusCode, errorMessage: '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<GenericPagination<FotoInstructionEntity>> getFotoInstructions() async {
    try {
      final response = await _dio.get(
        '/car/announcement/photo-instruction/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Token ${StorageRepository.getString(StorageKeys.TOKEN)}'
                }
              : {},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final v = GenericPagination.fromJson(response.data,
            (p0) => FotoInstructionModel.fromJson(p0 as Map<String, dynamic>));
        return v;
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
  Future<void> updateAnnouncement({
    required FormData announcementFormData,
    required int id,
  }) async {
    try {
      final response = await _dio.put(
        '/car/announcement/$id/update/',
        data: announcementFormData,
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
                }
              : {},
        ),
      );
      await Future.delayed(const Duration(milliseconds: 5000));
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
  Future<GenericPagination<GasEquipmentModel>> getGasEquipments({
    String? search,
    int? limit,
    int? offset,
  }) async {
    try {
      final result = await _dio.get('car/gas-equipments/',
          queryParameters: {
            'search': search,
            'limit': limit,
            'offset': offset,
          },
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
            },
          ));
      return GenericPagination.fromJson(result.data,
          (json) => GasEquipmentModel.fromJson(json as Map<String, dynamic>));
    } catch (e) {
      throw const ServerException();
    }
  }

  @override
  Future<GenericPagination<EquipmentModel>> getEquipments({
    String? search,
    int? limit,
    int? offset,
    int? modelId,
  }) async {
    try {
      final result = await _dio.get('car/equipments/$modelId/',
          queryParameters: {
            'search': search,
            'limit': limit,
            'offset': offset,
          },
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
            },
          ));
      return GenericPagination.fromJson(result.data,
          (json) => EquipmentModel.fromJson(json as Map<String, dynamic>));
    } catch (e) {
      throw const ServerException();
    }
  }

  @override
  Future<GenericPagination<EquipmentOptionsListModel>> getEquipmentOptionsList({
    String? search,
    int? limit,
    int? offset,
  }) async {
    // equipment opt
    try {
      final result = await _dio.get('car/equipments/options/list/',
          queryParameters: {
            'search': search,
            'limit': limit,
            'offset': offset,
          },
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
            },
          ));
      return GenericPagination.fromJson(
          result.data,
          (json) =>
              EquipmentOptionsListModel.fromJson(json as Map<String, dynamic>));
    } catch (e) {
      throw const ServerException();
    }
  }

  @override
  Future<GenericPagination<EquipmentOptionsModel>> getEquipmentOptions(
      {String? search, int? limit, int? offset, int? equipmentId}) async {
    try {
      final result = await _dio.get('car/equipments/options/$equipmentId/',
          queryParameters: {
            'search': search,
            'limit': limit,
            'offset': offset,
          },
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
            },
          ));
      return GenericPagination.fromJson(
          result.data,
          (json) =>
              EquipmentOptionsModel.fromJson(json as Map<String, dynamic>));
    } catch (e) {
      throw const ServerException();
    }
  }
}
