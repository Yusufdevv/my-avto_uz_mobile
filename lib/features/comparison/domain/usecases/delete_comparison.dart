import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';

class DeleteComparisonUseCase extends UseCase<void, int> {
  AdRepositoryImpl comparisonCarsRepo;
  DeleteComparisonUseCase({required this.comparisonCarsRepo});
  @override
  Future<Either<Failure, void>> call(int params) async =>
      comparisonCarsRepo.deleteComparison(params);
}
