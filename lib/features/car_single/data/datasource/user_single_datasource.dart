import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/car_single/domain/entities/user_single_entity.dart';
import 'package:auto/features/comparison/data/models/announcement_list_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

abstract class UserSingleDataSource {
  Future<UserSingleEntity> getUserSingle(
      {required int userId, required int announcementId});

  Future<GenericPagination<AnnouncementListModel>> getUserAds(
      {required int userId});
}

class UserSingleDataSourceImpl extends UserSingleDataSource {
  final Dio _dio = serviceLocator<DioSettings>().dio;

  UserSingleDataSourceImpl();

  @override
  Future<UserSingleEntity> getUserSingle(
      {required int userId, required int announcementId}) async {
    try {
      final results = await _dio.post(
        'car/announcement/owner-detail/',
        data: {'user': userId, 'announcement': announcementId},
        options: Options(headers: {
          'Authorization':
              'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
        }),
      );

      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return UserSingleEntity.fromJson(results.data);
      } else {
        throw ServerException(
            errorMessage: results.data.toString(),
            statusCode: results.statusCode ?? 0);
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
  Future<GenericPagination<AnnouncementListModel>> getUserAds(
      {required int userId}) async {
    try {
      final results = await _dio.get(
        '/car/announcement/owner/$userId/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
        }),
      );

      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return GenericPagination.fromJson(results.data,
            (p0) => AnnouncementListModel.fromJson(p0 as Map<String, dynamic>));
      } else {
        throw ServerException(
            errorMessage: results.data.toString(),
            statusCode: results.statusCode ?? 0);
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
