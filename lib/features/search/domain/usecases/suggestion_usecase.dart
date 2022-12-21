import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/features/search/domain/entities/suggestion_entity.dart';
import 'package:auto/features/search/domain/repositories/suggestion_repository.dart';
import 'package:auto/utils/either.dart';

class SuggestionUseCase extends UseCase<SuggestionEntity, String> {
  final SuggestionRepository repo;
  SuggestionUseCase({required this.repo});

  @override
  Future<Either<Failure, SuggestionEntity>> call(String params) async =>
      await repo.getSuggestions(params);
}
