import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/entities/car_model/car_model_entity.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class GetCarModelUseCase
    extends UseCase<GenericPagination<CarModelEntity>, CarModelParams> {
  final AdRepository repository;

  GetCarModelUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<CarModelEntity>>> call(
          CarModelParams params) =>
      repository.getCarModel(makeId: params.makeId, next: params.next);
}

class CarModelParams {
  final String? next;
  final int makeId;

  CarModelParams({
    required this.makeId,
    this.next,
  });
}
