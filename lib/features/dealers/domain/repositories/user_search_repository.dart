import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/models/user_search_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

// ignore: one_member_abstracts
abstract class UserSearchRepository {
  Future<Either<Failure, GenericPagination<UserSearchDealerModel>>> getUserSearches(
      String? search);
}
