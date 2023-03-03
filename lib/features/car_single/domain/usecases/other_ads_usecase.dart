import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/domain/repository/car_single_repository.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class OtherAdsUseCase
    implements UseCase<GenericPagination<AutoEntity>, Map<String, dynamic>> {
  final CarSingleRepository repository;

  OtherAdsUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<AutoEntity>>> call(
          Map<String, dynamic> params) =>
      repository.getOtherAds(params: params);
}
