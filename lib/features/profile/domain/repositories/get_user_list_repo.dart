import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/usecases/add_wishlist_usecase.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';

abstract class GetUserListRepository {
  const GetUserListRepository();

  Future<Either<ServerFailure, List<AutoEntity>>> getProfileFavorites(
      String endpoint);
  Future<Either<ServerFailure, List<NotificationsEntity>>> getNotifications();
  Future<Either<ServerFailure, List<MySearchesEntity>>> getMySearches();
  Future<Either<ServerFailure, NotificationsEntity>> getNotificationSingle(
      String id);
  Future<Either<ServerFailure, List<DirectoryEntity>>> getDirectories(
      String search, String regions, String categories);
  Future<Either<ServerFailure, List<DirCategoryEntity>>> getDirCategory();
  Future<Either<ServerFailure, DirectoryEntity>> getDirectory(String id);
  Future<Either<ServerFailure, String>> notificationAllRead();
}
