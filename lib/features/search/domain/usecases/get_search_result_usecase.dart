import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/domain/repositories/search_repository_repository.dart';
import 'package:auto/utils/either.dart';

class GetSearchResultsUseCase
    extends UseCase<GenericPagination<AutoModel>, String> {
  final SearchRepository repo ;
   GetSearchResultsUseCase({required this.repo});

  @override
  Future<Either<Failure, GenericPagination<AutoModel>>> call(
          String? params) async =>
     await  repo.getSearchResults(params);
}
