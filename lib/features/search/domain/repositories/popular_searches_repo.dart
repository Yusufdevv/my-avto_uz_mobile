import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/data/models/popular_search_model.dart';
import 'package:auto/utils/either.dart';

abstract class PopularSearchesRepository {
  Future<Either<Failure, GenericPagination<PopularSearchModel>>> getPopulars(
      String? search);
}
