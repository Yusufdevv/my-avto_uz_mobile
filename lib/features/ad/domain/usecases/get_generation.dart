import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/entities/generation/generation.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetGenerationUseCase
    extends UseCase<GenericPagination<GenerationEntity>, GenerationParams> {
  final AdRepository repository;

  GetGenerationUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<GenerationEntity>>> call(
          GenerationParams params) =>
      repository.getGeneration(
        modelId: params.modelId,
        year: params.year,
        next: params.next,
      );
}

class GenerationParams {
  final String? next;
  final int modelId;
  final int year;

  GenerationParams({
    required this.modelId,
    required this.year,
    this.next,
  });
}