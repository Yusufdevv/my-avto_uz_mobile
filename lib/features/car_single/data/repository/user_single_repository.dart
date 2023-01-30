import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/datasource/user_single_datasource.dart';
import 'package:auto/features/car_single/domain/repository/user_single_repository.dart';
import 'package:auto/features/dealers/data/models/cars_in_dealer_model.dart';
import 'package:auto/features/dealers/data/models/dealer_info_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class UserSingleRepositoryImpl extends UserSingleRepository {
  final UserSingleDataSource dataSource =
      serviceLocator<UserSingleDataSourceImpl>();

  UserSingleRepositoryImpl();
  @override
  Future<Either<Failure, GenericPagination<CarsInDealerModel>>> getUserAds(
      String params) async {
    try {
      final result = await dataSource.getUserAds(params: params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, DealerSingleModel>> getUserSingle(
      String params) async {
    try {
      final result = await dataSource.getUserSingle(params: params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }
}