import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/profile/data/models/favorite_model.dart';
import 'package:auto/features/profile/data/models/profile.dart';

import 'package:dio/dio.dart';

abstract class ProfileDataSource {
  Future<ProfileModel> getProfile();

  Future<ProfileModel> editProfile(
      {String? image, String? name, String? surName, int? region});

  Future<String> changePassword(
      {required String oldPassword, required String newPassword});

  Future<String> sendPhoneNumber({required String phoneNumber});

  Future<String> sendVerificationCode({required String phoneNumber, required String code,required String session});

  Future<List<FavoriteModel>> getProfileFavorites();
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await dio.get(
        '/users/detail-with-counts/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
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
  Future<ProfileModel> editProfile(
      {String? image, String? name, String? surName, int? region}) async {
    final data = FormData.fromMap({
      'first_name': name,
      'last_name': surName,
      'image': image,
      'region': region,
    });
    print('first_name: $name');

    try {
      // if (surName != null) {
      //   data.putIfAbsent('last_name', () => surName);
      // }
      // if (name != null) {
      //   data.putIfAbsent('first_name', () => name);
      // }
      // if (image != null) {
      //   data.putIfAbsent('image', () => image);
      // }
      // if (region != null) {
      //   data.putIfAbsent('region', () => region);
      // }

      final response = await dio.patch(
        '/users/detail/edit/',
        data: data,
        // options: Options(headers: {
        //   'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        // })
      );
      print(response.statusCode);
      print(response.data);
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
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return '';
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
  // users/wishlist/announcement/list/

  @override
  Future<List<FavoriteModel>> getProfileFavorites() async {
    try {
      final response = await dio.get(
        '/users/wishlist/announcement/list/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data['results'] as List)
            // ignore: unnecessary_lambdas
            .map((e) => FavoriteModel.fromJson(e))
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
  Future<String> sendPhoneNumber({required String phoneNumber}) async {
    try {
      final response = await dio.post(
        '/users/change-phone/sms-verification/entrypoint/',
        data: {'phone_number': phoneNumber},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['session'];
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
  Future<String> sendVerificationCode({required String phoneNumber, required String code, required String session}) async {
    try {
      final response = await dio.post(
        '/users/change-phone/',
        data: {'phone_number': phoneNumber,
                'code' : code,
                'session' : session
                },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          },
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return '';
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
