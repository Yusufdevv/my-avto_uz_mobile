import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetDriveTypeUseCase
    extends UseCase<GenericPagination<DriveTypeEntity>, DriveTypeParams> {
  final AdRepository repository = serviceLocator<AdRepositoryImpl>();

  GetDriveTypeUseCase();

  @override
  Future<Either<Failure, GenericPagination<DriveTypeEntity>>> call(
          DriveTypeParams params) =>
      repository.getDriveType(
        next: params.next,
        generationId: params.generationId,
        bodyTypeId: params.bodyTypeId,
        engineTypeId: params.engineTypeId,
      );
}

class DriveTypeParams {
  final String? next;
  final int bodyTypeId;
  final int generationId;
  final int engineTypeId;

  DriveTypeParams({
    required this.generationId,
    required this.bodyTypeId,
    required this.engineTypeId,
    this.next,
  });
}
