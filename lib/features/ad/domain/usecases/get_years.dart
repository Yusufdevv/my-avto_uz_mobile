import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/years/years.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';

class GetYearsUseCase extends UseCase<YearsEntity, YearsParams> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetYearsUseCase();

  @override
  Future<Either<Failure, YearsEntity>> call(YearsParams params) =>
      repository.getYears(modelId: params.modelId, next: params.next);
}

class YearsParams {
  final String? next;
  final int modelId;

  YearsParams({
    required this.modelId,
    this.next,
  });
}
