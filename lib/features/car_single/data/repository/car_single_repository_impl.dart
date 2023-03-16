import 'dart:async';

import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/car_single/data/datasource/car_single_datasource.dart';
import 'package:auto/features/car_single/data/model/create_owner.dart';
import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/car_single/domain/repository/car_single_repository.dart';
import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class CarSingleRepositoryImpl extends CarSingleRepository {
   final CarSingleDataSource dataSource = serviceLocator<CarSingleDataSourceImpl>();

  CarSingleRepositoryImpl();

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
  Future<Either<Failure, GenericPagination<AutoEntity>>> getOtherAds(
      {required Map<String, dynamic> params}) async {
    try {
      final result = await dataSource.getOtherAds(params: params);
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
  Future<Either<Failure, dynamic>> soldAds({required int id}) async {
    try {
      final result = await dataSource.soldAd(id: id);
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
  Future<Either<Failure, dynamic>> callCount({required int id}) async {
    try {
      final result = await dataSource.callCount(id: id);
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
  Future<Either<Failure, CreateOwnerModel>> verifyOwnerCreate(
      {required CreateOwnerModel createOwnerModel}) async {
    try {
      final result = await dataSource.verifyOwnerCreate(
          createOwnerModel: createOwnerModel);
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
  Future<Either<Failure, bool>> deleteApplication(int id) async {
    try {
      final result = await dataSource.deleteApplication(id);
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
