
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/domain/entities/user_single_entity.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/dealers/data/models/cars_in_dealer_model.dart'; 
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class UserSingleRepository {

  Future<Either<Failure, GenericPagination<AutoEntity>>> getUserAds(
      int params);

        Future<Either<Failure, UserSingleEntity>> getUserSingle(
     int userId, int announcementId);
}
