import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ads/data/models/min_max_price_year_model.dart';

abstract class AdsRepository {
  const AdsRepository();

  Future<Either<Failure, MinMaxPriceYearModel>> getMinMaxPriceYear(
      {String? currency}) {
    throw Exception('not implemented');
  }
}
