import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/entities/types/body_type.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetBodyTypesUseCase
    extends UseCase<GenericPagination<BodyTypeEntity>, NoParams> {
  final AdRepository repository;

  GetBodyTypesUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<BodyTypeEntity>>> call(
          NoParams params) =>
      repository.getBodyTypes();
}
