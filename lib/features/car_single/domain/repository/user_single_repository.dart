import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/domain/entities/user_single_entity.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class UserSingleRepository {
  Future<Either<Failure, GenericPagination<AnnouncementListEntity>>> getUserAds(
      int params);

  Future<Either<Failure, UserSingleEntity>> getUserSingle(
      int userId, int announcementId);
}
