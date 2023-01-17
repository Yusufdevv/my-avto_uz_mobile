import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/reels/data/datasources/reel_data_source.dart';
import 'package:auto/features/reels/data/models/reel_model.dart';
import 'package:auto/features/reels/domain/entities/reels_post_entity.dart';
import 'package:auto/features/reels/domain/repositories/reel_repository.dart';
import 'package:dio/dio.dart';

class ReelRepositoryImpl extends ReelRepository {
  final ReelDataSource dataSource = serviceLocator<ReelDataSource>();

  @override
  Future<Either<Failure, GenericPagination<ReelModel>>> getReels({
    String? search,
    int? limit,
    int? offset,
  }) async {
    try {
      final result = await dataSource.getReels(
        search: search,
        limit: limit,
        offset: offset,
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

  @override
  Future<Either<Failure, ReelsPostEntity>> getReelsLike({
    required int id,
  }) async {
    try {
      final result = await dataSource.reelsLike(id: id);
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
  Future<Either<Failure, ReelsPostEntity>> getReelsShare({
    required int id,
  }) async {
    try {
      final result = await dataSource.reelsShare(id: id);
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
