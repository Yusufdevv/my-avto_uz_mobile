import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, CommercialItemEntity>> getSearchResults();
}
