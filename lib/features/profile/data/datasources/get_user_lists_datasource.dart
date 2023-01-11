import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/profile/data/models/dir_category_model.dart';
import 'package:auto/features/profile/data/models/directory_model.dart';
import 'package:auto/features/profile/data/models/my_searches_model.dart';
import 'package:auto/features/profile/data/models/notifications_model.dart';
import 'package:dio/dio.dart';

abstract class GetUserListDatasource {
  Future<List<AutoModel>> getProfileFavoritesMyAds(String endpoint);

  Future<List<NotificationsModel>> getNotifications();
  Future<List<MySearchesModel>> getMySearches();
  Future<List<DirectoryModel>> getDirectories(
      String search, String regions, String categories);
  Future<List<DirCategoryModel>> getDirCategory();
  Future<DirectoryModel> getDirectory(String id);
  Future<NotificationsModel> getNotificationSingle(String id);
}

class GetUserListDatasourceImpl extends GetUserListDatasource {
  final dio = serviceLocator<DioSettings>().dio;

  @override
  Future<List<AutoModel>> getProfileFavoritesMyAds(String endpoint) async {
    try {
      final response = await dio.get(
        endpoint,
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data['results'] as List)
            // ignore: unnecessary_lambdas
            .map((e) => AutoModel.fromJson(e))
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
  Future<List<NotificationsModel>> getNotifications() async {
    try {
      final response = await dio.get(
        '/users/notification/list/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data['results'] as List)
            // ignore: unnecessary_lambdas
            .map((e) => NotificationsModel.fromJson(e))
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
  Future<List<MySearchesModel>> getMySearches() async {
    try {
      final response = await dio.get(
        '/users/filter-history/list/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data['results'] as List)
            // ignore: unnecessary_lambdas
            .map((e) => MySearchesModel.fromJson(e))
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
  Future<NotificationsModel> getNotificationSingle(String id) async {
    try {
      final response = await dio.get(
        'users/notification/$id/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return NotificationsModel.fromJson(response.data);
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
  Future<List<DirectoryModel>> getDirectories(
      String search, String regions, String categories) async {
    print('=======search ${search}');
    print('=======regions ${regions}');
    print('=======categories ${categories}');
    try {
      final response = await dio.get(
        '/car-place/list/?region__in=$regions&category__in=$categories&search=$search',
        // queryParameters: {
        //   'search': search,
        //   'region_in': regions,
        //   'categoriy_in': categories
        // },
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data['results'] as List)
            // ignore: unnecessary_lambdas
            .map((e) => DirectoryModel.fromJson(e))
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
  Future<List<DirCategoryModel>> getDirCategory() async {
    try {
      final response = await dio.get(
        '/car-place/category/list/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data['results'] as List)
            // ignore: unnecessary_lambdas
            .map((e) => DirCategoryModel.fromJson(e))
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
  Future<DirectoryModel> getDirectory(String id) async {
    try {
      final response = await dio.get(
        'users/notification/$id/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return DirectoryModel.fromJson(response.data);
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
