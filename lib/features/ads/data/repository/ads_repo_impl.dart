import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ads/data/data_source/ads_data_source.dart';
import 'package:auto/features/ads/data/models/min_max_price_year_model.dart';
import 'package:auto/features/ads/domain/repository/ads_repository.dart';
import 'package:dio/dio.dart';

class AdsRepositoryImpl extends AdsRepository {
  final AdsDataSource dataSource = serviceLocator<AdsDataSource>();

  @override
  Future<Either<Failure, MinMaxPriceYearModel>> getMinMaxPriceYear(
      {String? currency}) async {
    try {
      final result = await dataSource.getMinMaxPriceYear(currency: currency);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioException {
      return Left(DioFailure());
    } on DioError {
      return Left(DioFailure());
    }
  }
}
