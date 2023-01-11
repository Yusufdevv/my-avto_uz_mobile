import 'package:auto/core/exceptions/failures.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/core/usecases/usecase.dart';
import 'package:auto/core/utils/either.dart';
import 'package:auto/features/profile/data/repositories/get_user_list_repo_impl.dart';

class DeleteMySearchesUseCase extends UseCase<String, String> {
  GetUserListRepoImpl repository = serviceLocator<GetUserListRepoImpl>();

  @override
  Future<Either<Failure, String>> call(String params) async =>
      await repository.deleteMySearches(params);
}
