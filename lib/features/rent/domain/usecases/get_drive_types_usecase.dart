import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/entities/types/drive_type.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetDriveTypesUseCase
    extends UseCase<GenericPagination<DriveTypeEntity>, NoParams> {
  final AdRepository repository;

  GetDriveTypesUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<DriveTypeEntity>>> call(
          NoParams params) =>
      repository.driveTypesGet();
}
