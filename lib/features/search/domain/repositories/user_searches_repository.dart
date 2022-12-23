import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/data/models/user_searches_model.dart';
import 'package:auto/utils/either.dart';

abstract class UserSearchesRepository {
  Future<Either<Failure, GenericPagination<UserSearchesModel>>> getUserSearches(
      String? search);
}
