import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/data/models/popular_search_model.dart';
import 'package:auto/features/search/data/repositories/popular_searches_repository.dart';
import 'package:auto/features/search/domain/repositories/popular_searches_repo.dart';

class PopularSearchesUseCase
    extends UseCase<GenericPagination<PopularSearchModel>, String> {
  final PopularSearchesRepository repo = PopularSearchesRepositoryImpl();
  PopularSearchesUseCase();

  @override
  Future<Either<Failure, GenericPagination<PopularSearchModel>>> call(
          String? params) async =>
      await repo.getPopulars(params);
}
