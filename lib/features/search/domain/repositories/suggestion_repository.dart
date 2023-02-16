import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/search/data/models/search_suggest_model.dart';

abstract class SuggestionRepository {
  Future<Either<Failure, SearchSuggestModel>> getSuggestions(String text);
}
