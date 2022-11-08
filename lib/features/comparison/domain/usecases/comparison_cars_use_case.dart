import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/comparison/domain/entities/car_params_entity.dart';
import 'package:auto/features/comparison/domain/repositories/comparison_cars_repo.dart';
import 'package:auto/utils/either.dart';

class ComparisonCarsUseCase extends UseCase<List<CarParamsEntity>, NoParams> {
  ComparisonCarsRepo comparisonCarsRepo;
  ComparisonCarsUseCase({required this.comparisonCarsRepo});
  @override
  Future<Either<Failure, List<CarParamsEntity>>> call(NoParams params) async =>
      comparisonCarsRepo.getComparableCars();
}
