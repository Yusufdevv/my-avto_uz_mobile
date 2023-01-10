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
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> postComparisonCars(int id) async {
    try {
      final result = await comparisonCarsDataSource.postComparisonCars(id);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> deleteComparisonCars(int id) async {
    try {
      final result = await comparisonCarsDataSource.deleteComparisonCars(id);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
