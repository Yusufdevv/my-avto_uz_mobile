import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/comparison/data/datasources/comparison_cars_datasource.dart';
import 'package:auto/features/comparison/domain/entities/comparison_entity.dart';
import 'package:auto/features/comparison/domain/repositories/comparison_cars_repo.dart';

class ComparisonCarsRepoImpl extends ComparisonCarsRepo {
  final ComparisonDataSourceImpl comparisonCarsDataSource;

  ComparisonCarsRepoImpl({required this.comparisonCarsDataSource});
  @override
  Future<Either<Failure, List<ComparisonEntity>>> getComparableCars() async {
    try {
      final result = await comparisonCarsDataSource.getComparisonCars();
      print(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.errorMessage,
          statusCode: e.statusCode,
        ),
      );
    }
  }
  
  @override
  Future<Either<Failure, String>> postComparisonCars(int id)  async {
    try {
      final result = await comparisonCarsDataSource.postComparisonCars(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.errorMessage,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
