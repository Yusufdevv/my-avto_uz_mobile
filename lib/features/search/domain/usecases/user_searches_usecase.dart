import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';
import 'package:auto/features/search/data/models/user_searches_model.dart';
import 'package:auto/features/search/data/repositories/user_searches_repository_impl.dart';
import 'package:auto/features/search/domain/repositories/user_searches_repository.dart';

class UserSearchesUseCase
    extends UseCase<GenericPagination<UserSearchesModel>, String> {
  final UserSearchesRepository repo = UserSearchesRepositoryImpl();
  UserSearchesUseCase();

  @override
  Future<Either<Failure, GenericPagination<UserSearchesModel>>> call(
          String? params) async =>
      await repo.getUserSearches(params);
}
