import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ads/data/models/search_history_model.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/dealers/data/models/dealer_info_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/data/datasources/get_user_lists_datasource.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';
import 'package:dio/dio.dart';

class GetUserListRepoImpl extends GetUserListRepository {
  final GetUserListDatasourceImpl dataSource =
      serviceLocator<GetUserListDatasourceImpl>();

  GetUserListRepoImpl();

  @override
  Future<Either<Failure, DealerSingleModel>> getDirectorySingle(
      String params) async {
    try {
      final result = await dataSource.getDirectorySingle(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, GenericPagination<AutoEntity>>>
      getProfileFavoritesMyAds(
          {required String url, String? next, String? moderationStatus}) async {
    try {
      final result = await dataSource.getProfileFavoritesMyAds(
          url: url,
          next: next,
          fromJson: AutoModel.fromJson,
          moderationStatus: moderationStatus);
      return result;
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, NotificationsEntity>> getNotificationSingle(
      String id) async {
    try {
      final result = await dataSource.getNotificationSingle(id);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, GenericPagination<NotificationsEntity>>>
      getNotifications({int? filter, String? next}) async {
    try {
      final result =
          await dataSource.getNotifications(filter: filter, next: next);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, GenericPagination<MySearchesEntity>>> getMySearches(
      String next) async {
    try {
      final result = await dataSource.getMySearches(next);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, List<DirCategoryEntity>>> getDirCategory() async {
    try {
      final result = await dataSource.getDirCategory();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, List<DirectoryEntity>>> getDirectories(
      String search, String regions, String categories) async {
    try {
      final result =
          await dataSource.getDirectories(search, regions, categories);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, DirectoryEntity>> getDirectory(String id) async {
    try {
      final result = await dataSource.getDirectory(id);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, String>> notificationAllRead() async {
    try {
      final result = await dataSource.notificationAllRead();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteMySearches(List<int> ids) async {
    try {
      final result = await dataSource.deleteMySearches(ids);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }
}
