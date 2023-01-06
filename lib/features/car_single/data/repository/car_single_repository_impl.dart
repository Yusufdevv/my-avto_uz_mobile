import 'dart:async';

import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/datasource/car_single_datasource.dart';
import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/car_single/domain/entities/elastic_search_entity.dart';
import 'package:auto/features/car_single/domain/repository/car_single_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class CarSingleRepositoryImpl extends CarSingleRepository {
  late final CarSingleDataSource dataSource;

  CarSingleRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, CarSingleEntity>> getCarSingle(
      {required int id}) async {
    try {
      final result = await dataSource.getCarSingle(id: id);
    
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
  Future<Either<Failure, GenericPagination<ElasticSearchEntity>>> getOtherAds(
      {required int id}) async {
    try {
      final result = await dataSource.getOtherAds(id: id);
      print('REPOSITORY DATA ${Right(result)}');
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
  Future<Either<Failure, CarSingleEntity>> payInvoice() async {
    try {
      final result = await dataSource.payInvoice();
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
}
