import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/car_single/domain/entities/other_ads_entity.dart';
import 'package:auto/features/car_single/domain/repository/car_single_repository.dart';
import 'package:auto/utils/either.dart';

class OtherAdsUseCase implements UseCase<OtherAdsEntity, NoParams> {
  final CarSingleRepository repository;

  OtherAdsUseCase({required this.repository});

  @override
  Future<Either<Failure, OtherAdsEntity>> call(NoParams params) async =>
      repository.getOtherAds();
}
