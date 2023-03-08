import 'dart:developer';

import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/models/dealer_single_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/data/models/dir_category_model.dart';
import 'package:auto/features/profile/data/models/directory_model.dart';
import 'package:auto/features/profile/data/models/my_searches_model.dart';
import 'package:auto/features/profile/data/models/notifications_model.dart';
import 'package:dio/dio.dart';

abstract class GetUserListDatasource {
  Future<Either<Failure, GenericPagination<T>>> getProfileFavoritesMyAds<T>(
      {required String url,
      required T Function(Map<String, dynamic>) fromJson,
      String? next,
      String? moderationStatus});

  Future<GenericPagination<NotificationsModel>> getNotifications(
      {int? filter, String? next});

  Future<GenericPagination<MySearchesModel>> getMySearches(String next);

  Future<List<DirectoryModel>> getDirectories(
      String search, String regions, String categories);

  Future<List<DirCategoryModel>> getDirCategory();

  Future<DirectoryModel> getDirectory(String id);

  Future<String> notificationAllRead();

  Future<String> deleteMySearches(List<int> ids);

  Future<NotificationsModel> getNotificationSingle(String id);

  Future<DealerSingleModel> getDirectorySingle(String params);
}

class GetUserListDatasourceImpl extends GetUserListDatasource {
  final dio = serviceLocator<DioSettings>().dio;

  @override
  Future<Either<Failure, GenericPagination<T>>> getProfileFavoritesMyAds<T>(
      {required String url,
      required T Function(Map<String, dynamic>) fromJson,
      String? next,
      String? moderationStatus}) async {
    log(':::::::::: getProfileFavoritesMyAds triggeered:  $moderationStatus} $next  ::::::::::');
    var query = <String, dynamic>{};
    if (moderationStatus != null) {
      query = {'moderation_status__in': moderationStatus};
    }
    try {
      final response = await dio.get(
        next != null && next.isNotEmpty ? next : url,
        queryParameters: query,
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      log(':::::::::: GOTTEN DATA OF MY ADS:  ${response.data} \n SEPERATOR SEPERATOR SEPERATOR SEPERATOR SEPERATOR SEPERATOR   ::::::::::');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        try{
          final data = GenericPagination<T>.fromJson(
              response.data!, (data) => fromJson(data as Map<String, dynamic>));
          return Right(data);
        }catch (e){
          log(':::::::::: CATCHEN EXCEPTION OF MY ADS:  ${e.toString()}  ::::::::::');
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
  Future<GenericPagination<NotificationsModel>> getNotifications(
      {int? filter, String? next}) async {
    var query = <String, dynamic>{};
    if (filter != null) {
      query = {'is_read': filter};
    }
    if (next != null) {
      query = {'next': next};
    }

    try {
      final response = await dio.get(
        '/users/notification/list/',
        queryParameters: query,
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => NotificationsModel.fromJson(p0 as Map<String, dynamic>));
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
  Future<GenericPagination<MySearchesModel>> getMySearches(String next) async {
    try {
      final response = await dio.get(
        next.isEmpty ? '/users/filter-history/list/' : next,
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return GenericPagination.fromJson(response.data,
            (p0) => MySearchesModel.fromJson(p0 as Map<String, dynamic>));
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
    try {
      final response = await dio.get(
        '/car-place/list/?region__in=$regions&category__in=$categories&search=$search',
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
  Future<DealerSingleModel> getDirectorySingle(String params) async {
    try {
      final results = await dio.get('/car-place/$params/');

      if (results.statusCode! >= 200 && results.statusCode! < 300) {
        return DealerSingleModel.fromJson(results.data);
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
        '/car-place/$id/',
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

  @override
  Future<String> notificationAllRead() async {
    try {
      final response = await dio.post(
        'users/notification/read-all/',
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['message'];
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
  Future<String> deleteMySearches(List<int> ids) async {
    try {
      final response = await dio.delete(
        '/users/filter-history/delete/',
        data: {'ids_list': ids},
        options: Options(headers: {
          'Authorization': 'Bearer ${StorageRepository.getString('token')}'
        }),
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
