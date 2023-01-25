import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/dealers/data/models/dealer_info_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/profile/domain/entities/dir_category_entity.dart';
import 'package:auto/features/profile/domain/entities/directory_entity.dart';
import 'package:auto/features/profile/domain/entities/my_searches_entity.dart';
import 'package:auto/features/profile/domain/entities/notifications_entity.dart';

abstract class GetUserListRepository {
  Future<Either<Failure, GenericPagination<AutoModel>>> getProfileFavorites(
      {required String url, String? next});
  Future<Either<ServerFailure, List<NotificationsEntity>>> getNotifications();
  Future<Either<ServerFailure, List<MySearchesEntity>>> getMySearches();
  Future<Either<ServerFailure, NotificationsEntity>> getNotificationSingle(
      String id);
  Future<Either<ServerFailure, List<DirectoryEntity>>> getDirectories(
      String search, String regions, String categories);
  Future<Either<ServerFailure, List<DirCategoryEntity>>> getDirCategory();
  Future<Either<ServerFailure, DirectoryEntity>> getDirectory(String id);
  Future<Either<Failure, DealerSingleModel>> getDirectorySingle(String params);
  Future<Either<ServerFailure, String>> notificationAllRead();
  Future<Either<ServerFailure, String>> deleteMySearches(List<int> ids);
}
