import 'dart:developer';

import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/ads/data/data_source/ads_data_source.dart';
import 'package:auto/features/ads/data/models/min_max_price_year_model.dart';
import 'package:auto/features/ads/data/models/save_filter_model.dart';
import 'package:auto/features/ads/domain/repository/ads_repository.dart';
import 'package:auto/features/comparison/domain/entities/announcement_list_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
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

  @override
  Future<Either<Failure, void>> filterHistory(
      {required SaveFilterModel model}) async {
    try {
      final result = await dataSource.filterHistory(model: model);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<AnnouncementListEntity>>>
      getAnnouncementList(Map<String, dynamic> params) async {
    log(':::::::::: Announcement list entitity repo impls triggered ${params}  ::::::::::');
    try {
      final result = await dataSource.getAnnouncementList(params);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }
}
