import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/car_single/domain/repository/car_single_repository.dart';
import 'package:auto/utils/either.dart';

class GetAdsUseCase implements UseCase<CarSingleEntity, NoParams> {
  final CarSingleRepository repository;

  GetAdsUseCase({required this.repository});

  @override
  Future<Either<Failure, CarSingleEntity>> call(NoParams params) async =>
      repository.getCarAds();
}
