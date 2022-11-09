import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/search/domain/entities/popular_searches_entity.dart';
import 'package:auto/utils/either.dart';

abstract class PopularSearchesRepository {
  Future<Either<Failure, PopularSearchesEntity>> getPopulars();
}
