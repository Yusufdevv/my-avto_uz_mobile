import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

// ignore: one_member_abstracts
abstract class SearchRepository {
  Future<Either<Failure, GenericPagination<AutoModel>>> getSearchResults(
      Map<String, dynamic> params);
}
