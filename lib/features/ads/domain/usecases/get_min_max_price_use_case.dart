import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ads/data/repository/ads_repo_impl.dart';
import 'package:auto/features/ads/domain/entities/min_max_price_year_entity.dart';
import 'package:auto/features/ads/domain/repository/ads_repository.dart';

class GetMinMaxPriceYearUseCase extends UseCase<MinMaxPriceYearEntity, String> {
  final AdsRepository repo = serviceLocator<AdsRepositoryImpl>();

  @override
  Future<Either<Failure, MinMaxPriceYearEntity>> call(String params) async =>
      await repo.getMinMaxPriceYear(currency: params);
}
