import 'package:auto/core/exceptions/exceptions.dart';
import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/data/datasources/search_results_datasource.dart';
import 'package:auto/features/search/domain/repositories/search_repository_repository.dart';
import 'package:auto/utils/either.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchResultsDatasource dataSource;

  SearchRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, GenericPagination<AutoModel>>>
      getSearchResults() async {
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
