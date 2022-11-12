import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/search/data/datasources/popular_searches_datasource.dart';
import 'package:auto/features/search/domain/entities/popular_searches_entity.dart';
import 'package:auto/features/search/domain/repositories/popular_searches_repo.dart';
import 'package:auto/utils/either.dart';

class PopularSearchesRepositoryImpl extends PopularSearchesRepository {
  final PopularSearchesDataSource dataSource;

  PopularSearchesRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, PopularSearchesEntity>> getPopulars() async {
    try {
      final result = await dataSource.getPopularSearches();
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
