import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/profile/data/models/profile.dart';

import 'package:dio/dio.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();

  Future<ProfileModel> editProfile(
      {String? image, String? name, String? surName, int? region});

  Future<String> changePassword(
      {required String oldPassword, required String newPassword});
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
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
      print(StorageRepository.getString('token'));
      print(response.data);
      print(response.statusCode);
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
    final data = <String, dynamic>{};
    print('first_name: $name');

    try {
      if (surName != null) {
        data.putIfAbsent('last_name', () => surName);
      }
      if (name != null) {
        data.putIfAbsent('first_name', () => name);
      }
      if (image != null) {
        data.putIfAbsent('image', () => image);
      }

      final response = await dio.patch('/users/detail/edit/',
          data: data,
          options: Options(headers: {
            'Authorization': 'Bearer ${StorageRepository.getString('token')}'
          }));
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
