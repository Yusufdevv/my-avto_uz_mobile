import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

abstract class SearchRepository {
  Future<Either<Failure, GenericPagination<AutoModel>>> getSearchResults(String? searchedText);
}
