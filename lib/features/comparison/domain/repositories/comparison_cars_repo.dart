import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/comparison/domain/entities/comparison_entity.dart';

// ignore: one_member_abstracts
abstract class ComparisonCarsRepo {
  Future<Either<Failure, List<ComparisonEntity>>> getComparableCars();
  Future<Either<Failure, void>> postComparisonCars(int id);
   Future<Either<Failure, void>> deleteComparisonCars(int id);
}
