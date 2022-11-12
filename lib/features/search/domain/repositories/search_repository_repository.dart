import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/search/domain/entities/commercial_item_entity.dart';
import 'package:auto/utils/either.dart';

abstract class SearchRepository {
  Future<Either<Failure, CommercialItemEntity>> getSearchResults();
}
