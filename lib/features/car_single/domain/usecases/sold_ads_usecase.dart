import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/domain/repository/car_single_repository.dart';

class SoldAdsUseCase implements UseCase<dynamic, int> {
  final CarSingleRepository repository;

  SoldAdsUseCase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(int params) async =>
      repository.soldAds(id: params);
}
