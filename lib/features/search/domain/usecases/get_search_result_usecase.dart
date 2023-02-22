import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/data/repositories/search_repository.dart';
import 'package:auto/features/search/domain/repositories/search_repository_repository.dart';

class GetSearchResultsUseCase
    extends UseCase<GenericPagination<AutoModel>, Map<String, dynamic>> {
  final SearchRepository repo = SearchRepositoryImpl();
  GetSearchResultsUseCase();

  @override
  Future<Either<Failure, GenericPagination<AutoModel>>> call(
          Map<String, dynamic> params) async =>
      await repo.getSearchResults(params);
}
