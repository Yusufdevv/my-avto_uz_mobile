import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ad/domain/repositories/ad_repository.dart';
import 'package:auto/features/common/entities/makes_entity.dart';

class GetCarModelUseCase extends UseCase<GetMakeEntity, CarModelParams> {
  final AdRepository repository;

  GetCarModelUseCase({required this.repository});

  @override
  Future<Either<Failure, GetMakeEntity>> call(CarModelParams params) =>
      repository.getCarModel(makeId: params.makeId, next: params.next);
}

class CarModelParams {
  final String? next;
  final int makeId;

  const CarModelParams({
    this.makeId = 1,
    this.next = '',
  });
}
