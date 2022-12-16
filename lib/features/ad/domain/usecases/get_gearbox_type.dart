import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetGearboxTypeUseCase
    extends UseCase<GenericPagination<GearboxTypeEntity>, GearboxTypeParams> {
  final AdRepository repository;

  GetGearboxTypeUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<GearboxTypeEntity>>> call(
          GearboxTypeParams params) =>
      repository.getGearboxType(
        next: params.next,
        generationId: params.generationId,
        bodyTypeId: params.bodyTypeId,
        engineTypeId: params.engineTypeId,
        driveTypeId: params.driveTypeId,
      );
}

class GearboxTypeParams {
  final String? next;
  final int bodyTypeId;
  final int generationId;
  final int engineTypeId;
  final int driveTypeId;

  GearboxTypeParams({
    required this.generationId,
    required this.bodyTypeId,
    required this.engineTypeId,
    required this.driveTypeId,
    this.next,
  });
}
