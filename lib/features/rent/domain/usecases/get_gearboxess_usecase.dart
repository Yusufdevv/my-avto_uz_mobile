import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetGearBoxessUseCase
    extends UseCase<GenericPagination<GearboxTypeEntity>, NoParams> {
  final AdRepository repository;

  GetGearBoxessUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<GearboxTypeEntity>>> call(
          NoParams params) =>
      repository.gearboxessGet();
}
