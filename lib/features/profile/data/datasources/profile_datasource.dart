import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/profile/data/models/car_product.dart';
import 'package:auto/features/profile/data/models/product_category.dart';
import 'package:auto/features/profile/data/models/profile.dart';
import 'package:auto/features/profile/data/models/profile_data_model.dart';
import 'package:auto/features/profile/data/models/terms_of_use_model.dart';
import 'package:auto/features/profile/domain/entities/car_product.dart';
import 'package:auto/features/profile/domain/entities/product_category.dart';

import 'package:dio/dio.dart';

abstract class ProfileDataSource {
  Future<ProfileDataModel> getProfile();

  Future<ProfileModel> editProfile(
      {String? image, String? fullName, int? region, String? email});

  Future<String> changePassword(
      {required String oldPassword, required String newPassword});

  Future<String> sendPhoneNumber({required String phoneNumber});

  Future<String> sendVerificationCode(
      {required String phoneNumber,
      required String code,
      required String session});

  Future<TermsOfUseModel> getTermsOfUseData(String slug);

  Future<List<ProductCategory>> productCategory(String slug);

  Future<List<ProductCategory>> productList(String slug);

  Future<List<CarProductModel>> getCarProductByCategory(String slug, int id);
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  @override
  Future<ProfileDataModel> getProfile() async {
    try {
      final response = await dio.get(
        '/users/detail-with-counts/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ProfileDataModel.fromJson(response.data);
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
  Future<ProfileModel> editProfile(
      {String? image, String? fullName, int? region, String? email}) async {
    final data = FormData.fromMap({
      'full_name': '$fullName',
      'image': image != null ? await MultipartFile.fromFile(image) : null,
      'region': region,
      'email': email
    });
    try {
      final response = await dio.patch('/users/detail/edit/',
          data: data,
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          }));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ProfileModel.fromJson(response.data);
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
  Future<String> changePassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      final response = await dio.post(
        '/users/change-password/',
        data: {'old_password': oldPassword, 'new_password': newPassword},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      } else if (response.statusCode != null &&
          response.statusCode! >= 400 &&
          response.statusCode! < 500) {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? ((response.data as Map).values.first as List)[0]
                      : '')
                  .toString());
        } else {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: response.data['phone']);
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

//'/users/wishlist/announcement/list/'

  @override
  Future<String> sendPhoneNumber({required String phoneNumber}) async {
    try {
      final response = await dio.post(
        '/users/change-phone/sms-verification/entrypoint/',
        data: {'phone_number': phoneNumber},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['session'];
      } else if (response.statusCode != null &&
          response.statusCode! >= 400 &&
          response.statusCode! < 500) {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first
                      : 'Wrong number!')
                  .toString());
        } else {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: response.data['phone']);
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
  Future<String> sendVerificationCode(
      {required String phoneNumber,
      required String code,
      required String session}) async {
    try {
      final response = await dio.post(
        '/users/change-phone/',
        data: {'phone_number': phoneNumber, 'code': code, 'session': session},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return '';
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0,
          errorMessage: response.data['code'] ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<TermsOfUseModel> getTermsOfUseData(String slug) async {
    try {
      final response = await dio.get(
        '/common/static-pages/$slug/',
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return TermsOfUseModel.fromJson(response.data);
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
  Future<List<ProductCategoryModel>> productCategory(String slug) async {
    try {
      final response = await dio.get(
        '/car-place/$slug/product/category/list/',
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data['results'] as List)
            .map((e) => ProductCategoryModel.fromJson(e))
            .toList();
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
  Future<List<CarProductModel>> getCarProductByCategory(
      String slug, int id) async {
    try {
      final response = await dio.get(
        '/car-place/$slug/$id/list/',
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data['results'] as List)
            .map((e) => CarProductModel.fromJson(e))
            .toList();
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
  Future<List<ProductCategory>> productList(String slug) async {
    try {
      final response = await dio.get(
        '/car-place/$slug/product/list/',
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data['results'] as List)
            .map((e) => ProductCategoryModel.fromJson(e))
            .toList();
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
