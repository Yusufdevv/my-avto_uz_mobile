import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/types/engine_type.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetEngineTypeUseCase
    extends UseCase<GenericPagination<EngineTypeEntity>, EngineTypeParams> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetEngineTypeUseCase();

  @override
  Future<Either<Failure, GenericPagination<EngineTypeEntity>>> call(
          EngineTypeParams params) =>
      repository.getEngineType(
          next: params.next,
          generationId: params.generationId,
          bodyTypeId: params.bodyTypeId);
}

class EngineTypeParams {
  final String? next;
  final int bodyTypeId;
  final int generationId;

  EngineTypeParams({
    required this.generationId,
    required this.bodyTypeId,
    this.next,
  });
}
