import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/search/data/models/search_suggest_model.dart';
import 'package:auto/features/search/domain/repositories/suggestion_repository.dart';

class SuggestionUseCase extends UseCase<SearchSuggestModel, String> {
  final SuggestionRepository repo;
  SuggestionUseCase({required this.repo});

  @override
  Future<Either<Failure, SearchSuggestModel>> call(String params) async =>
      await repo.getSuggestions(params);
}
