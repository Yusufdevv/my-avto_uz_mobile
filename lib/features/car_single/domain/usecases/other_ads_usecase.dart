import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/domain/entities/elastic_search_entity.dart';
import 'package:auto/features/car_single/domain/repository/car_single_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class OtherAdsUseCase implements UseCase<GenericPagination, int> {
  final CarSingleRepository repository;

  OtherAdsUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<ElasticSearchEntity>>> call(int params) =>
      repository.getOtherAds(id: params);
}
