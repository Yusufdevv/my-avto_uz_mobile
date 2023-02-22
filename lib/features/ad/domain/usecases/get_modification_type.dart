import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/types/modification_type.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetModificationTypeUseCase extends UseCase<
    GenericPagination<ModificationTypeEntity>, ModificationTypeParams> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetModificationTypeUseCase();

  @override
  Future<Either<Failure, GenericPagination<ModificationTypeEntity>>> call(
          ModificationTypeParams params) =>
      repository.getModificationType(
        next: params.next,
        generationId: params.generationId,
        bodyTypeId: params.bodyTypeId,
        engineTypeId: params.engineTypeId,
        driveTypeId: params.driveTypeId,
        gearBoxTypeTypeId: params.gearBoxTypeTypeId,
      );
}

class ModificationTypeParams {
  final String? next;
  final int? bodyTypeId;
  final int? generationId;
  final int? engineTypeId;
  final int? driveTypeId;
  final int? gearBoxTypeTypeId;

  ModificationTypeParams({
    this.generationId,
    this.bodyTypeId,
    this.engineTypeId,
    this.driveTypeId,
    this.gearBoxTypeTypeId,
    this.next,
  });
}
