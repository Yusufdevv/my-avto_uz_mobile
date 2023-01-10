import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/profile/data/datasources/get_user_lists_datasource.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';
import 'package:auto/features/profile/domain/repositories/get_user_list_repo.dart';

class GetUserListRepoImpl extends GetUserListRepository {
  final GetUserListDatasourceImpl dataSource;

  GetUserListRepoImpl({required this.dataSource});
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
  Future<Either<ServerFailure, NotificationsEntity>> getNotificationSingle(String id
      ) async {
    try {
      final result = await dataSource.getNotificationSingle(id);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }
  @override
  Future<Either<ServerFailure, List<NotificationsEntity>>> getNotifications(
      ) async {
    try {
      final result = await dataSource.getNotifications();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, List<MySearchesEntity>>> getMySearches(
      ) async {
    try {
      final result = await dataSource.getMySearches();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, List<DirCategoryEntity>>> getDirCategory()async {
 try {
      final result = await dataSource.getDirCategory();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure, List<DirectoryEntity>>> getDirectories()async {
 try {
      final result = await dataSource.getDirectories();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<ServerFailure,  DirectoryEntity>> getDirectory(String id)async {
  try {
      final result = await dataSource.getDirectory(id);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(
          statusCode: error.statusCode, errorMessage: error.errorMessage));
    }
  }
}
