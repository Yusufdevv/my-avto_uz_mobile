import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/datasource/user_single_datasource.dart';
import 'package:auto/features/car_single/domain/entities/user_single_entity.dart';
import 'package:auto/features/car_single/domain/repository/user_single_repository.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class UserSingleRepositoryImpl extends UserSingleRepository {
  final UserSingleDataSource dataSource =
      serviceLocator<UserSingleDataSourceImpl>();

  UserSingleRepositoryImpl();
  @override
  Future<Either<Failure, GenericPagination<AutoEntity>>> getUserAds(
      int userId) async {
    try {
      final result = await dataSource.getUserAds(userId: userId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, UserSingleEntity>> getUserSingle(
      int userId, int announcementId) async {
    try {
      final result = await dataSource.getUserSingle(userId: userId, announcementId: announcementId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }
}
