import 'dart:developer';

import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/car_single/data/model/car_single_model.dart';
import 'package:auto/features/car_single/data/model/create_owner.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class CarSingleDataSource {
  Future<CarSingleModel> getCarSingle({required int id});

  Future<GenericPagination<AutoModel>> getOtherAds(
      {required Map<String, dynamic> params});

  Future soldAd({required int id});

  Future callCount({required int id});

  Future<CreateOwnerModel> verifyOwnerCreate(
      {required CreateOwnerModel createOwnerModel});

  Future<bool> deleteApplication(int id);
}

class CarSingleDataSourceImpl extends CarSingleDataSource {
  final _dio = serviceLocator<DioSettings>().dio;

  @override
  Future<CarSingleModel> getCarSingle({required int id}) async {
    try {
      final response = await _dio.get(
        '/car/announcement/$id/detail/',
        options: Options(headers: {
          'Authorization':
              'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
        }),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        try {
          log(':::::::::: the data: ${response.data}  ::::::::::');
          return CarSingleModel.fromJson(response.data);
        } catch (e) {
          log(':::::::::: the carsingle from json exception: ${e.toString()}  ::::::::::');
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: response.data.toString());
        }
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
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
  Future<GenericPagination<AutoModel>> getOtherAds(
      {required Map<String, dynamic> params}) async {
    try {
      final response = await _dio.get('/es/AnnouncementElasticSearch/',
          queryParameters: params,
          options: Options(headers: {
            'Authorization':
                'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => AutoModel.fromJson(p0 as Map<String, dynamic>));
      } else if (response.data is Map) {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: ((response.data as Map).values.isNotEmpty
                    ? (response.data as Map).values.first
                    : 'error while get other ads')
                .toString());
      } else {
        await StorageRepository.deleteString(StorageKeys.TOKEN);
      }
      if (response.data is Map) {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: ((response.data as Map).values.isNotEmpty
                    ? (response.data as Map).values.first
                    : 'Error get CarAds')
                .toString());
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
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
  Future soldAd({required int id}) async {
    try {
      final response = await _dio.post('/car/announcement/$id/sold/',
          options: Options(headers: {
            'Authorization':
                'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data;
      } else if (response.statusCode != null &&
          response.statusCode! >= 400 &&
          response.statusCode! < 500) {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first
                      : 'Failed')
                  .toString());
        }
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
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
  Future callCount({required int id}) async {
    try {
      final response = await _dio.post('/car/announcement/call/',
          data: {'announcement': id},
          options: Options(headers: {
            'Authorization':
                'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data;
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
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
  Future<CreateOwnerModel> verifyOwnerCreate(
      {required CreateOwnerModel createOwnerModel}) async {
    final datas = {
      'announcement': createOwnerModel.announcement,
      'technical_passport_front': await MultipartFile.fromFile(
          createOwnerModel.technicalPasswordFront,
          filename: createOwnerModel.technicalPasswordFront.split('/').last),
      'technical_passport_back': await MultipartFile.fromFile(
          createOwnerModel.technicalPasswordBack,
          filename: createOwnerModel.technicalPasswordBack.split('/').last),
      'driver_license_front': await MultipartFile.fromFile(
          createOwnerModel.driverLicenceFront,
          filename: createOwnerModel.driverLicenceFront.split('/').last),
      'driver_license_back': await MultipartFile.fromFile(
          createOwnerModel.driverlicenceBack,
          filename: createOwnerModel.driverlicenceBack.split('/').last),
      'additional_info': createOwnerModel.additionalInfo
    };
    try {
      final response = await _dio.post('/car/announcement/verify-owner/create/',
          data: FormData.fromMap(datas),
          options: Options(headers: {
            'Authorization':
                'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return CreateOwnerModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
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
  Future<bool> deleteApplication(int id) async {
    try {
      final response = await _dio.delete(
          '/car/announcement/verify-owner/$id/delete/',
          options: Options(headers: {
            'Authorization':
                'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          }));
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return true;
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
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
