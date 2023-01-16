import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/dealers/data/models/user_search_model.dart';
import 'package:auto/features/dealers/domain/repositories/user_search_repository.dart';
import 'package:auto/features/pagination/models/generic_pagination.dart';

class UserSearchUseCase extends UseCase<GenericPagination<UserSearchDealerModel>, String> {
  final UserSearchRepository repo;
  UserSearchUseCase({required this.repo});

  @override
  Future<Either<Failure, GenericPagination<UserSearchDealerModel>>> call(String? params) async =>
      await repo.getUserSearches(params);
}
