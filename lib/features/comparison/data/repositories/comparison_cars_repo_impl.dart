import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/comparison/data/datasources/comparison_cars_datasource.dart';
import 'package:auto/features/comparison/domain/entities/car_params_entity.dart';
import 'package:auto/features/comparison/domain/repositories/comparison_cars_repo.dart';
import 'package:auto/utils/either.dart';

class ComparisonCarsRepoImpl extends ComparisonCarsRepo {
  final ComparisonCarsDataSource comparisonCarsDataSource;

  ComparisonCarsRepoImpl({required this.comparisonCarsDataSource});
  @override
  Future<Either<Failure, List<CarParamsEntity>>> getComparableCars() async {
    try {
      final result = await comparisonCarsDataSource.getComparisonCars();
      print(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
