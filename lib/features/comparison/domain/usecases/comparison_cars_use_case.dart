import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/comparison/domain/entities/comparison_entity.dart';
import 'package:auto/features/comparison/domain/repositories/comparison_cars_repo.dart';
import 'package:auto/core/utils/either.dart';

class ComparisonCarsUseCase extends UseCase<List<ComparisonEntity>, NoParams> {
  ComparisonCarsRepo comparisonCarsRepo;
  ComparisonCarsUseCase({required this.comparisonCarsRepo});
  @override
  Future<Either<Failure, List<ComparisonEntity>>> call(NoParams params) async =>
      comparisonCarsRepo.getComparableCars();
}
