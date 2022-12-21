import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/features/search/data/models/suggestion_model.dart';
import 'package:auto/utils/either.dart';

abstract class SuggestionRepository {
  Future<Either<Failure, SuggestionModel>> getSuggestions(String text);
}
