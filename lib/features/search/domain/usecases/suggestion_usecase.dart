import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/common/domain/model/car_make_model.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/domain/repositories/suggestion_repository.dart';

class SuggestionUseCase extends UseCase<GenericPagination<CarMakeModel>, String> {
  final SuggestionRepository repo;
  SuggestionUseCase({required this.repo});

  @override
  Future<Either<Failure, GenericPagination<CarMakeModel>>> call(String params) async =>
      await repo.getSuggestions(params);
}
