import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/datasource/cars_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/models/cars_in_dealer_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

// ignore: one_member_abstracts
abstract class CarsInDealerRepository {
  Future<Either<Failure, GenericPagination<CarsInDealerModel>>> getCars(
      {required String slug, String? next});
}

class CarsInDealerRepositoryImpl extends CarsInDealerRepository {
  final CarsInDealerDataSource dataSource;

  CarsInDealerRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, GenericPagination<CarsInDealerModel>>> getCars(
      {required String slug, String? next}) async {
    try {
      final result = await dataSource.getCars(slug: slug, next: next);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }
}
