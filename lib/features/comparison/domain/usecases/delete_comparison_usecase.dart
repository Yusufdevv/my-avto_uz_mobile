import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/comparison/data/repositories/comparison_cars_repo_impl.dart';
import 'package:auto/features/comparison/domain/repositories/comparison_cars_repo.dart';

class DeleteComparisonUseCase extends UseCase<void, int> {
  ComparisonCarsRepo comparisonCarsRepo =
      serviceLocator<ComparisonCarsRepoImpl>();

  DeleteComparisonUseCase();

  @override
  Future<Either<Failure, void>> call(int params) async =>
      comparisonCarsRepo.deleteComparisonCars(params);
}
