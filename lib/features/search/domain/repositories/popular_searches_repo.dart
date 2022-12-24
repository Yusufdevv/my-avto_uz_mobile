import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/data/models/popular_search_model.dart';

abstract class PopularSearchesRepository {
  Future<Either<Failure, GenericPagination<PopularSearchModel>>> getPopulars(
      String? search);
}
