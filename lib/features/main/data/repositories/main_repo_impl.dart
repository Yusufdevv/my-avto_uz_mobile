import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/main/data/datasources/main_data_source.dart';
import 'package:auto/features/main/data/models/story_model.dart';
import 'package:auto/features/main/domain/repositories/main_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:dio/dio.dart';

class MainRepositoryImpl extends MainRepository {
  final MainDataSource dataSource = serviceLocator<MainDataSource>();

  @override
  Future<Either<Failure, GenericPagination<StoryModel>>> getStories({
    String? category,
    String? search,
    int? limit,
    int? offset,
  }) async {
    try {
      final result = await dataSource.getStories(
        category: category,
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
  Future<Either<Failure, dynamic>> readStory({required int itemId}) async {
    try {
      final result = await dataSource.readStory(
        itemId: itemId,
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
