import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/profile/data/models/profile.dart';

import 'package:dio/dio.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final dio = serviceLocator<DioSettings>().dio;

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await dio.get('/users/detail-with-counts/',
          options: Options(
            headers: StorageRepository.getString('token').isNotEmpty
                ? {'Authorization': 'Token ${StorageRepository.getString('token')}'}
                : {},
          ));
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return ProfileModel.fromJson(response.data);
      }
      throw ServerException(
          statusCode: response.statusCode ?? 0, errorMessage: response.statusMessage ?? '');
    } on ServerException {
      rethrow;
    } on DioError {
      throw DioException();
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
