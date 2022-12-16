import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/entities/years/years.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetYearsUseCase
    extends UseCase<GenericPagination<YearsEntity>, YearsParams> {
  final AdRepository repository;

  GetYearsUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<YearsEntity>>> call(
          YearsParams params) =>
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
