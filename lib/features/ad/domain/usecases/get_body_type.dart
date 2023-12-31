import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetBodyTypeUseCase
    extends UseCase<GenericPagination<BodyTypeEntity>, BodyTypeParams> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetBodyTypeUseCase();

  @override
  Future<Either<Failure, GenericPagination<BodyTypeEntity>>> call(
          BodyTypeParams params) =>
      repository.getBodyType(
        generationId: params.generationId,
        next: params.next,
      );
}

class BodyTypeParams {
  final String? next;
  final int? generationId;

  BodyTypeParams({
    this.generationId,
    this.next,
  });
}
