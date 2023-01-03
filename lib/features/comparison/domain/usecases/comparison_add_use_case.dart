import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/comparison/domain/repositories/comparison_cars_repo.dart';

class ComparisonAddUseCase extends UseCase<String, int> {
  ComparisonCarsRepo comparisonAddRepo;
  ComparisonAddUseCase({required this.comparisonAddRepo});
  @override
  Future<Either<Failure, String>> call(int params) async =>
      comparisonAddRepo.postComparisonCars(params);
}