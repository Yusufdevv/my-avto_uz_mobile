import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/data/datasources/yandex_search_datasource.dart';
import 'package:auto/features/common/models/yandex_search_model.dart';
import 'package:dio/dio.dart';

abstract class YandexSearchRepository {
  const YandexSearchRepository();

  Future<Either<Failure, YandexSearchModel>> getAddress({
    String? type,
    String? long,
    String? lat,
  }) {
    throw Exception('not implemented');
  }
}

class YandexSearchRepoImpl extends YandexSearchRepository {
  final YandexSearchDataSource dataSource = YandexSearchDataSource();

  @override
  Future<Either<Failure, YandexSearchModel>> getAddress({
    String? type,
    String? long,
    String? lat,
  }) async {
    try {
      final result = await dataSource.getAddress(
        type: type,
        long: long,
        lat: lat,
      );
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
