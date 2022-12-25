import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/ad/data/models/body_type.dart';
import 'package:auto/features/ad/data/models/car_model.dart';
import 'package:auto/features/ad/data/models/drive_type.dart';
import 'package:auto/features/ad/data/models/engine_type.dart';
import 'package:auto/features/ad/data/models/gearbox_type.dart';
import 'package:auto/features/ad/data/models/generation.dart';
import 'package:auto/features/ad/data/models/make.dart';
import 'package:auto/features/ad/data/models/modification_type.dart';
import 'package:auto/features/ad/data/models/years.dart';
import 'package:auto/features/common/entities/makes_entity.dart';
import 'package:auto/features/common/models/get_make_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class AdRemoteDataSource {
  Future<GenericPagination<MakeModel>> getTopMakes({String? next});

  Future<GetMakeEntity> getMake();

  Future<GenericPagination<CarModel>> getCarModel({
    required int makeId,
    String? next,
  });

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
}

class AdRemoteDataSourceImpl extends AdRemoteDataSource {
  final Dio _dio;

  AdRemoteDataSourceImpl(this._dio);

  @override
  Future<GenericPagination<MakeModel>> getTopMakes({
    String? next,
  }) async {
    final response = await _dio.get(
      '/car/makes/top/',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
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
  }

  @override
  Future<GetMakeEntity> getMake() async {
    final response = await _dio.get(
      '/car/makes/',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
            : {},
      ),
    );
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      print('Bu Bizdaa Response ${response.data}');
      return GetMakeModel.fromJson(response.data);
    } else {
      throw ServerException(
          statusCode: response.statusCode!, errorMessage: response.data);
    }
  }

  @override
  Future<GenericPagination<CarModel>> getCarModel({
    required int makeId,
    String? next,
  }) async {
    final response = await _dio.get(
      '/car/$makeId/models/',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
            : {},
      ),
    );
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return GenericPagination.fromJson(
          response.data, (p0) => CarModel.fromJson(p0 as Map<String, dynamic>));
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
    final response = await _dio.get(
      '/car/$modelId/${year}generations/',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
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
  }

  @override
  Future<GenericPagination<BodyTypeModel>> getBodyType({
    required int generationId,
    String? next,
  }) async {
    final response = await _dio.get(
      '/car/$generationId/body-types/',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
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
  }

  @override
  Future<GenericPagination<BodyTypeModel>> bodyTypesGet({
    String? next,
  }) async {
    final response = await _dio.get(
      '/car/body-types/',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
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
  }

  @override
  Future<GenericPagination<EngineTypeModel>> getEngineType({
    required int generationId,
    required int bodyTypeId,
    String? next,
  }) async {
    final response = await _dio.get(
      '/car/$generationId/$bodyTypeId/engine_type/',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
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
  }

  @override
  Future<GenericPagination<DriveTypeModel>> getDriveType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    String? next,
  }) async {
    final response = await _dio.get(
      '/car/$generationId/$bodyTypeId/$engineTypeId/drive_type/',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
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
  }

  @override
  Future<GenericPagination<DriveTypeModel>> driveTypesGet() async {
    final response = await _dio.get(
      '/car/drive-types/',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
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
  }

  @override
  Future<GenericPagination<GearboxTypeModel>> getGearboxType({
    required int generationId,
    required int bodyTypeId,
    required int engineTypeId,
    required int driveTypeId,
    String? next,
  }) async {
    final response = await _dio.get(
      '/car/$generationId/$bodyTypeId/$engineTypeId/$driveTypeId/gearbox_type',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
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
  }

  @override
  @override
  Future<GenericPagination<GearboxTypeModel>> gearboxessGet() async {
    final response = await _dio.get(
      '/car/gearbox-types/',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
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
    final response = await _dio.get(
      '/car/$generationId/$bodyTypeId/$engineTypeId/$driveTypeId/$gearBoxTypeTypeId/modification-type/',
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
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
  }

  @override
  Future<void> createAnnouncement({
    required FormData announcementFormData,
  }) async {
    final response = await _dio.post(
      '/car/announcement/create/',
      data: announcementFormData,
      options: Options(
        headers: StorageRepository.getString('token').isNotEmpty
            ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
            : {},
      ),
    );
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
    } else {
      throw ServerException(
          statusCode: response.statusCode!, errorMessage: response.data);
    }
  }
}
