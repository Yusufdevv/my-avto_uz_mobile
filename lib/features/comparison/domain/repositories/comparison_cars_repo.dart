import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/comparison/domain/entities/car_params_entity.dart';
import 'package:auto/utils/either.dart';

abstract class ComparisonCarsRepo {
  Future<Either<Failure, List<CarParamsEntity>>> getComparableCars();
}
