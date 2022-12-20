
import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/search/data/datasources/search_results_datasource.dart';
import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
import 'package:auto/features/search/domain/repositories/search_repository_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchResultsDatasource dataSource;

  SearchRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, CommercialItemEntity>> getSearchResults() async {
    try {
      final result = await dataSource.getSearchResults();
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
