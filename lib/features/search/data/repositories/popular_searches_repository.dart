import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/data/datasources/popular_searches_datasource.dart';
import 'package:auto/features/search/data/models/popular_search_model.dart';
import 'package:auto/features/search/domain/repositories/popular_searches_repo.dart';

class PopularSearchesRepositoryImpl extends PopularSearchesRepository {
  final PopularSearchesDataSource dataSource;

  PopularSearchesRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, GenericPagination<PopularSearchModel>>> getPopulars(
      String? search) async {
    try {
      final result = await dataSource.getPopularSearches(search);
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
