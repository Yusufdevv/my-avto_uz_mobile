import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/dealers/data/models/dealer_single_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';

abstract class GetUserListRepository {
  Future<Either<Failure, GenericPagination<AutoEntity>>>
      getProfileFavoritesMyAds(
          {required String url, String? next, String? moderationStatus});
  Future<Either<Failure, GenericPagination<NotificationsEntity>>>
      getNotifications({int? filter, String? next});
  Future<Either<Failure, GenericPagination<MySearchesEntity>>> getMySearches(
      String next);
  Future<Either<Failure, NotificationsEntity>> getNotificationSingle(String id);
  Future<Either<Failure, GenericPagination<DirectoryEntity>>> getDirectories(
      String search, String regions, String categories, String? next);
  Future<Either<Failure, GenericPagination<DirCategoryEntity>>> getDirCategory(String? next);
  Future<Either<Failure, DirectoryEntity>> getDirectory(String id);
  Future<Either<Failure, DealerSingleModel>> getDirectorySingle(String params);
  Future<Either<Failure, String>> notificationAllRead();
  Future<Either<Failure, String>> deleteMySearches(List<int> ids);
}
