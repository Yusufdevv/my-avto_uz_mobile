import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/dealers/data/models/dealer_info_model.dart';
import 'package:auto/features/profile/data/datasources/get_user_lists_datasource.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetUserListRepoImpl extends GetUserListRepository {
  GetUserListDatasourceImpl dataSource;

  GetUserListRepoImpl({required this.dataSource});

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
    }
  }

  @override
  Future<Either<ServerFailure, List<AutoEntity>>> getProfileFavorites(
      String endpoint) async {
    try {
      final result = await dataSource.getProfileFavoritesMyAds(endpoint);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, NotificationsEntity>> getNotificationSingle(
      String id) async {
    try {
      final result = await dataSource.getNotificationSingle(id);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, List<NotificationsEntity>>>
      getNotifications() async {
    try {
      final result = await dataSource.getNotifications();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, List<MySearchesEntity>>> getMySearches() async {
    try {
      final result = await dataSource.getMySearches();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, List<DirCategoryEntity>>>
      getDirCategory() async {
    try {
      final result = await dataSource.getDirCategory();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, List<DirectoryEntity>>> getDirectories(
      String search, String regions, String categories) async {
    try {
      final result =
          await dataSource.getDirectories(search, regions, categories);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, DirectoryEntity>> getDirectory(String id) async {
    try {
      final result = await dataSource.getDirectory(id);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, String>> notificationAllRead() async {
    try {
      final result = await dataSource.notificationAllRead();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, String>> deleteMySearches(List<int> ids) async {
    try {
      final result = await dataSource.deleteMySearches(ids);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }
}
